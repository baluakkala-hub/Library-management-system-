import { Injectable, signal } from '@angular/core';

export type ThemeMode = 'light' | 'dark';

@Injectable({
  providedIn: 'root'
})
export class ThemeService {
  private readonly THEME_KEY = 'smart_lms_theme';
  currentTheme = signal<ThemeMode>('dark');

  constructor() {
    this.initializeTheme();
  }

  private initializeTheme(): void {
    const saved = localStorage.getItem(this.THEME_KEY) as ThemeMode | null;
    const initial: ThemeMode = saved === 'light' ? 'light' : 'dark';
    this.setTheme(initial);
  }

  setTheme(theme: ThemeMode): void {
    this.currentTheme.set(theme);
    localStorage.setItem(this.THEME_KEY, theme);
    const root = document.documentElement;
    const body = document.body;

    if (theme === 'dark') {
      root.setAttribute('data-theme', 'dark');
      body.classList.add('dark-theme');
    } else {
      root.setAttribute('data-theme', 'light');
      body.classList.remove('dark-theme');
    }
  }

  toggleTheme(): void {
    const next = this.currentTheme() === 'dark' ? 'light' : 'dark';
    this.setTheme(next);
  }

  isDark(): boolean {
    return this.currentTheme() === 'dark';
  }
}
