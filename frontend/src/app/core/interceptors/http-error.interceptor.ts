import { HttpInterceptorFn, HttpErrorResponse } from '@angular/common/http';
import { catchError, retry, throwError, timer } from 'rxjs';

export const httpErrorInterceptor: HttpInterceptorFn = (req, next) => {
  return next(req).pipe(
    retry({
      count: 2,
      delay: (error: HttpErrorResponse) => {
        // If connection refused (backend still booting up), auto-retry after 1.5s
        if (error.status === 0) {
          return timer(1500);
        }
        throw error;
      }
    }),
    catchError((error: HttpErrorResponse) => {
      let errorMessage = 'An unknown error occurred!';
      
      if (error.status === 0) {
        errorMessage = 'Unable to connect to the backend server. Please ensure the backend is running on port 8080.';
      } else if (error.error instanceof ErrorEvent) {
        errorMessage = `Error: ${error.error.message}`;
      } else if (error.error && error.error.message) {
        errorMessage = error.error.message;
      } else {
        errorMessage = `Error Code: ${error.status} - ${error.message}`;
      }

      console.error('API Error:', errorMessage);
      if (error.status !== 0) {
        alert(`[Error] ${errorMessage}`);
      }
      return throwError(() => new Error(errorMessage));
    })
  );
};
