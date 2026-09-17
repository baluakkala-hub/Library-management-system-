-- ==============================================================================
-- UNIVERSITY SMART LIBRARY MANAGEMENT SYSTEM (LMS) - COMPREHENSIVE SEED DATASET
-- 56 University Textbooks Across All Branches: CSE, ECE, MECH, CIVIL, MATH & MBA
-- Includes: Physical Location (Aisle, Shelf, Column/Rack), Semantic Metadata & Loans
-- ==============================================================================

-- 1. COMPUTER SCIENCE & ENGINEERING (CSE / IT) - 15 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0132350884', 'Clean Code', 'Robert C. Martin', 'Computer Science', 5, 4, 
        'Even bad code can function. But if code isn''t clean, it can bring a development organization to its knees. A handbook of agile software craftsmanship with best practices for writing readable, maintainable code.',
        'clean code, software craftsmanship, refactoring, best practices, agile, readable code, object oriented', 
        2008, 4.8, 128, 'Aisle 1 (CSE/IT)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0201633610', 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma et al.', 'Computer Science', 4, 3, 
        'Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems.',
        'design patterns, gang of four, creational, structural, behavioral, software architecture, oop, singleton, factory', 
        1994, 4.7, 95, 'Aisle 1 (CSE/IT)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134685991', 'Effective Java', 'Joshua Bloch', 'Computer Science', 4, 3, 
        'The definitive guide to best practices in Java platform design. Features updated advice on lambdas, streams, generics, enums, annotations, and concurrency.',
        'java, jvm, effective java, best practices, concurrency, generics, streams, object oriented programming', 
        2018, 4.9, 142, 'Aisle 1 (CSE/IT)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0262033848', 'Introduction to Algorithms (CLRS)', 'Thomas H. Cormen et al.', 'Computer Science', 6, 5, 
        'A comprehensive textbook covering a broad range of algorithms in depth, yet making their design and analysis accessible to all levels of readers. The premier global computer science textbook.',
        'algorithms, data structures, graph theory, dynamic programming, sorting, complexity, big-o, greedy algorithms', 
        2009, 4.9, 230, 'Aisle 1 (CSE/IT)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1118063330', 'Operating System Concepts', 'Abraham Silberschatz et al.', 'Computer Science', 5, 4, 
        'The ninth edition of Operating System Concepts continues to provide a solid theoretical foundation for understanding operating systems, memory management, process scheduling, concurrency, and virtual memory.',
        'operating systems, processes, threads, cpu scheduling, deadlock, memory management, virtual memory, file systems, linux', 
        2012, 4.7, 180, 'Aisle 1 (CSE/IT)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0132126953', 'Computer Networks', 'Andrew S. Tanenbaum & David Wetherall', 'Computer Science', 5, 3, 
        'Appropriate for Computer Networking or Introduction to Networking courses at undergraduate and graduate levels. Covers TCP/IP, OSI model, wireless networks, routing algorithms, and network security.',
        'computer networks, tcp ip, routing, protocols, ethernet, wifi, socket programming, packet switching, security', 
        2010, 4.8, 160, 'Aisle 1 (CSE/IT)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0078022159', 'Database System Concepts', 'Abraham Silberschatz, Henry F. Korth & S. Sudarshan', 'Computer Science', 6, 4, 
        'Database System Concepts by Silberschatz, Korth and Sudarshan is now in its 6th edition and is one of the cornerstone texts of database education. Covers relational model, SQL, indexing, transactions, and query optimization.',
        'database systems, sql, relational database, transactions, acid, b-tree indexing, query optimization, rdbms, normalization', 
        2010, 4.7, 140, 'Aisle 1 (CSE/IT)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1491950357', 'Designing Data-Intensive Applications', 'Martin Kleppmann', 'Computer Science', 4, 3, 
        'Data is at the center of many challenges in system design today. Explore the principles, algorithms, and trade-offs of distributed data systems, replication, partitioning, and stream processing.',
        'distributed systems, scalability, replication, partitioning, transactions, consensus, data engineering, nosql, batch processing', 
        2017, 4.9, 210, 'Aisle 1 (CSE/IT)', 'Shelf B2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0262035613', 'Deep Learning', 'Ian Goodfellow, Yoshua Bengio & Aaron Courville', 'Artificial Intelligence', 4, 3, 
        'An accessible, comprehensive textbook on deep learning by pioneering leaders in the field. Covers deep neural networks, backpropagation, convolutional networks, sequence modeling, and optimization.',
        'neural networks, deep learning, artificial intelligence, backpropagation, machine learning, computer vision, cnn, rnn, ai', 
        2016, 4.8, 175, 'Aisle 1 (CSE/IT)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0136042594', 'Artificial Intelligence: A Modern Approach', 'Stuart Russell & Peter Norvig', 'Artificial Intelligence', 5, 4, 
        'The long-anticipated revision of this best-selling text offers the most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence. Covers search, knowledge representation, and probabilistic reasoning.',
        'artificial intelligence, ai, heuristic search, logic, machine learning, knowledge representation, planning, agents, nlp', 
        2010, 4.9, 260, 'Aisle 1 (CSE/IT)', 'Shelf C1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1492032649', 'Hands-On Machine Learning', 'Aurelien Geron', 'Artificial Intelligence', 3, 2, 
        'A beginner-friendly practical guide to building intelligent systems using Python, Scikit-Learn, Keras, and TensorFlow. Teaches concepts through concrete working examples and neural network models.',
        'beginner-friendly, machine learning, neural networks, scikit-learn, tensorflow, keras, deep learning, artificial intelligence', 
        2019, 4.9, 190, 'Aisle 1 (CSE/IT)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134444284', 'Cryptography and Network Security', 'William Stallings', 'Computer Science', 4, 4, 
        'In an age of viruses and hackers, of electronic eavesdropping and electronic fraud, security is paramount. Principles and practice of modern cryptography, RSA, AES, digital signatures, and firewalls.',
        'cryptography, network security, ciphers, encryption, rsa, aes, hash functions, digital signatures, ssl, tls, authentication', 
        2017, 4.6, 95, 'Aisle 1 (CSE/IT)', 'Shelf C2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0321486813', 'Compilers: Principles, Techniques, and Tools (Dragon Book)', 'Alfred Aho, Monica Lam, Ravi Sethi & Jeffrey Ullman', 'Computer Science', 3, 3, 
        'Known to professors, students, and developers as the Dragon Book, this classic provides a thorough introduction to compiler design, lexical analysis, syntax-directed translation, and code generation.',
        'compilers, parsing, lexical analysis, syntax trees, dragon book, optimization, grammars, intermediate code, code generation', 
        2006, 4.7, 110, 'Aisle 1 (CSE/IT)', 'Shelf D1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1617294549', 'Cloud Native Patterns', 'Cornelia Davis', 'Computer Science', 4, 3, 
        'Designing change-tolerant software in the cloud. Cloud Native Patterns shows you how to build software architectures with microservices, automated scaling, dynamic routing, and fault tolerance.',
        'cloud computing, microservices, docker, kubernetes, patterns, scalability, resilient systems, distributed architecture', 
        2019, 4.6, 75, 'Aisle 1 (CSE/IT)', 'Shelf D1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1492040347', 'Database Internals', 'Alex Petrov', 'Computer Science', 3, 3, 
        'A developer''s guide to how database engines work, from data structures such as B-Trees and LSM Trees to distributed consensus and distributed transaction coordinators.',
        'database internals, storage engines, b-trees, lsm trees, distributed storage, consensus, raft, paxos, replication', 
        2019, 4.8, 85, 'Aisle 1 (CSE/IT)', 'Shelf D2', 'Rack 1');

-- 2. ELECTRICAL & ELECTRONICS ENGINEERING (ECE / EEE) - 10 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0199339136', 'Microelectronic Circuits', 'Adel S. Sedra & Kenneth C. Smith', 'Electrical Engineering', 6, 5, 
        'Microelectronic Circuits by Sedra and Smith remains the gold standard of electrical engineering education. Covers operational amplifiers, semiconductor diodes, MOSFETs, and bipolar junction transistors.',
        'microelectronics, circuits, semiconductors, mosfet, bjt, op amp, analog design, vlsi, amplifiers', 
        2014, 4.8, 195, 'Aisle 2 (ECE/EEE)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0138147570', 'Signals and Systems', 'Alan V. Oppenheim & Alan S. Willsky', 'Electrical Engineering', 5, 4, 
        'This comprehensive exploration of signals and systems develops continuous-time and discrete-time concepts in parallel. Essential for communication engineering, Fourier analysis, and Laplace transforms.',
        'signals and systems, continuous time, discrete time, fourier transform, laplace, z-transform, linear systems, filters', 
        1996, 4.7, 210, 'Aisle 2 (ECE/EEE)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0131873742', 'Digital Signal Processing: Principles, Algorithms & Applications', 'John G. Proakis & Dimitris Manolakis', 'Electrical Engineering', 4, 3, 
        'A significant, widely used text covering the fundamentals of discrete-time signals, systems, modern digital processing algorithms, and filter design.',
        'dsp, digital signal processing, filter design, fir, iir, fft, discrete fourier transform, spectral estimation', 
        2006, 4.6, 130, 'Aisle 2 (ECE/EEE)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0133760033', 'Electric Circuits', 'James W. Nilsson & Susan Riedel', 'Electrical Engineering', 5, 4, 
        'The foundational introduction to circuit analysis. Covers Ohm''s law, Kirchhoff''s laws, Thevenin and Norton theorems, AC steady-state analysis, and RLC resonance.',
        'circuits, electrical engineering, kirchhoff, ohms law, ac analysis, dc analysis, thevenin, norton, rlc resonance', 
        2014, 4.7, 150, 'Aisle 2 (ECE/EEE)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0136156734', 'Modern Control Engineering', 'Katsuhiko Ogata', 'Electrical Engineering', 4, 3, 
        'Senior-level text for control systems in mechanical, electrical, and aerospace engineering. Covers state-space representations, root locus, Bode plots, and PID controllers.',
        'control systems, transfer function, root locus, bode plot, pid controller, state space, stability, feedback control', 
        2009, 4.8, 140, 'Aisle 2 (ECE/EEE)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134440019', 'Power Electronics: Circuits, Devices, and Applications', 'Muhammad H. Rashid', 'Electrical Engineering', 4, 4, 
        'Covers the characteristics of power semiconductor devices and their applications in rectifiers, inverters, DC-DC converters, and motor drive systems.',
        'power electronics, thyristor, igbt, inverter, rectifier, dc-dc converter, motor drives, power conversion', 
        2017, 4.5, 90, 'Aisle 2 (ECE/EEE)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073529585', 'Semiconductor Physics and Devices', 'Donald A. Neamen', 'Electrical Engineering', 4, 3, 
        'Provides an understanding of the physics of semiconductor materials and operation of electronic devices such as PN junctions, bipolar transistors, and MOS capacitors.',
        'semiconductors, physics, pn junction, energy bands, carrier transport, bjt, mosfet, bandgap, solid state', 
        2011, 4.6, 85, 'Aisle 2 (ECE/EEE)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0471386780', 'Embedded System Design: A Unified Hardware/Software Introduction', 'Frank Vahid & Tony Givargis', 'Electrical Engineering', 5, 4, 
        'Modern embedded systems design principles. Explores microcontroller architectures, digital logic synthesis, hardware-software co-design, and real-time operating systems.',
        'embedded systems, microcontroller, arm, fpga, hardware software codesign, rtos, sensors, interfaces', 
        2001, 4.7, 115, 'Aisle 2 (ECE/EEE)', 'Shelf B2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0471697909', 'Communication Systems', 'Simon Haykin & Michael Moher', 'Electrical Engineering', 4, 3, 
        'This bestselling text offers an in-depth treatment of analog and digital communication systems, modulation schemes (AM, FM, QAM), noise analysis, and information theory.',
        'communication systems, analog modulation, digital modulation, qam, am, fm, noise, shannon capacity, telecommunications', 
        2006, 4.6, 120, 'Aisle 2 (ECE/EEE)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1118642061', 'Antenna Theory: Analysis and Design', 'Constantine A. Balanis', 'Electrical Engineering', 3, 3, 
        'The bible of antenna engineering. Covers fundamental antenna parameters, radiation patterns, microstrip antennas, horn antennas, and phased arrays.',
        'antennas, electromagnetic theory, radiation pattern, microstrip, phased arrays, dipole, rf engineering, microwave', 
        2015, 4.8, 95, 'Aisle 2 (ECE/EEE)', 'Shelf C1', 'Rack 2');

-- 3. MECHANICAL ENGINEERING - 10 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073398174', 'Thermodynamics: An Engineering Approach', 'Yunus A. Cengel & Michael A. Boles', 'Mechanical Engineering', 6, 5, 
        'The world''s leading engineering thermodynamics textbook. Covers energy balance, the first and second laws of thermodynamics, entropy, power cycles (Rankine, Brayton), and refrigeration.',
        'thermodynamics, energy, entropy, heat, work, power cycles, rankine cycle, brayton, refrigeration, ideal gas', 
        2014, 4.8, 220, 'Aisle 3 (Mechanical)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073382173', 'Fluid Mechanics', 'Frank M. White', 'Mechanical Engineering', 5, 4, 
        'Widely respected for its readable presentation, physical intuition, and strong mathematical rigor. Covers fluid statics, Bernoulli equation, Navier-Stokes, and boundary layer theory.',
        'fluid mechanics, bernoulli, navier stokes, boundary layer, laminar flow, turbulent flow, pipe flow, viscosity', 
        2015, 4.7, 185, 'Aisle 3 (Mechanical)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073398204', 'Shigley''s Mechanical Engineering Design', 'Richard G. Budynas & J. Keith Nisbett', 'Mechanical Engineering', 5, 4, 
        'The standard reference for mechanical engineers. Covers stress analysis, fatigue failure, shafts, gears, springs, bearings, and bolted joints.',
        'mechanical design, machine design, shigley, stress analysis, fatigue failure, gears, shafts, bearings, springs', 
        2014, 4.9, 240, 'Aisle 3 (Mechanical)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0470501979', 'Fundamentals of Heat and Mass Transfer', 'Frank P. Incropera et al.', 'Mechanical Engineering', 5, 4, 
        'Known for its rigorous approach to conduction, convection, and radiation. Provides practical problem-solving methodologies for heat exchangers and thermal systems.',
        'heat transfer, mass transfer, conduction, convection, radiation, heat exchangers, thermal conductivity, thermodynamics', 
        2011, 4.8, 175, 'Aisle 3 (Mechanical)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134319650', 'Mechanics of Materials', 'Russell C. Hibbeler', 'Mechanical Engineering', 5, 4, 
        'Clear and thorough presentation of the theory and applications of mechanics of materials. Covers stress, strain, torsion, bending, shear stresses, and beam deflections.',
        'mechanics of materials, stress, strain, beam deflection, torsion, bending, mohrs circle, elasticity, mechanical testing', 
        2016, 4.7, 160, 'Aisle 3 (Mechanical)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0195371239', 'Theory of Machines and Mechanisms', 'John J. Uicker et al.', 'Mechanical Engineering', 4, 3, 
        'Covers the kinematics and dynamics of machinery. Explores linkages, cam design, gear trains, balancing of rotating masses, and gyroscopic couples.',
        'theory of machines, kinematics, dynamics, mechanisms, linkages, cams, gear trains, balancing, vibrations', 
        2010, 4.6, 110, 'Aisle 3 (Mechanical)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0070583733', 'CAD/CAM: Principles and Applications', 'P. N. Rao', 'Mechanical Engineering', 4, 3, 
        'A comprehensive text explaining computer-aided design and computer-aided manufacturing. Covers geometric modeling, CNC machining, rapid prototyping, and CIM systems.',
        'cad cam, computer aided design, cnc programming, solid modeling, finite element, rapid prototyping, manufacturing automation', 
        2010, 4.5, 95, 'Aisle 3 (Mechanical)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0201543612', 'Introduction to Robotics: Mechanics and Control', 'John J. Craig', 'Mechanical Engineering', 4, 4, 
        'Focused on the mechanics and control of robotic manipulators. Covers forward and inverse kinematics, Jacobians, trajectory generation, and robotic actuator dynamics.',
        'robotics, robot manipulators, kinematics, inverse kinematics, jacobian, trajectory planning, control systems, mechatronics', 
        2004, 4.8, 130, 'Aisle 3 (Mechanical)', 'Shelf B2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1259002076', 'Internal Combustion Engine Fundamentals', 'John B. Heywood', 'Mechanical Engineering', 3, 3, 
        'The classic graduate and undergraduate text on engine design, combustion chemistry, emissions, performance parameters, and thermal efficiency.',
        'ic engines, combustion, automotive, emissions, thermal efficiency, four stroke, two stroke, fuel injection, turbocharging', 
        2011, 4.7, 85, 'Aisle 3 (Mechanical)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0133128741', 'Manufacturing Engineering and Technology', 'Serope Kalpakjian & Steven Schmid', 'Mechanical Engineering', 4, 4, 
        'Covers the breadth of modern manufacturing processes: casting, forming, machining, welding, additive manufacturing, and quality control.',
        'manufacturing, casting, machining, welding, metallurgy, additive manufacturing, forming, quality engineering', 
        2013, 4.7, 120, 'Aisle 3 (Mechanical)', 'Shelf C1', 'Rack 2');

-- 4. CIVIL & ENVIRONMENTAL ENGINEERING - 8 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134610474', 'Structural Analysis', 'Russell C. Hibbeler', 'Civil Engineering', 5, 4, 
        'The definitive structural analysis textbook. Provides a clear and thorough presentation of the theory and application of structural analysis as it applies to trusses, beams, and frames.',
        'structural analysis, civil engineering, trusses, beams, frames, moment distribution, slope deflection, finite element, loads', 
        2017, 4.8, 170, 'Aisle 4 (Civil)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-8170087915', 'Soil Mechanics and Foundations', 'B. C. Punmia & Ashok Jain', 'Civil Engineering', 5, 4, 
        'Standard university reference on geotechnical engineering. Covers soil classification, permeability, shear strength, bearing capacity of shallow and deep foundations.',
        'soil mechanics, geotechnical, foundations, soil classification, bearing capacity, settlement, slope stability, earth pressure', 
        2005, 4.7, 190, 'Aisle 4 (Civil)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073293493', 'Design of Concrete Structures', 'Arthur H. Nilson, David Darwin & Charles Dolan', 'Civil Engineering', 5, 3, 
        'Comprehensive guide to the analysis and design of reinforced concrete structures in accordance with current ACI building codes. Covers flexure, shear, torsion, and columns.',
        'concrete design, reinforced concrete, rcc, aci code, flexure, shear, columns, slabs, prestressed concrete', 
        2010, 4.7, 140, 'Aisle 4 (Civil)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0074603994', 'Surveying and Levelling', 'N. N. Basak', 'Civil Engineering', 4, 4, 
        'Fundamental textbook covering chain surveying, compass surveying, theodolite surveying, tacheometry, contouring, and modern total stations and GPS mapping.',
        'surveying, levelling, theodolite, total station, gps, contouring, triangulation, mapping, civil surveying', 
        2001, 4.6, 125, 'Aisle 4 (Civil)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0130814197', 'Transportation Engineering and Planning', 'C. S. Papacostas & P. D. Prevedouros', 'Civil Engineering', 4, 3, 
        'Interdisciplinary overview of transportation systems, urban traffic planning, highway capacity analysis, geometric design, and transit engineering.',
        'transportation, highway design, traffic engineering, pavement design, geometric design, urban planning', 
        2001, 4.5, 95, 'Aisle 4 (Civil)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0070491342', 'Environmental Engineering', 'Howard S. Peavy, Donald Rowe & George Tchobanoglous', 'Civil Engineering', 4, 3, 
        'Covers the engineering approach to environmental challenges: water quality engineering, wastewater treatment, air pollution control, and solid waste management.',
        'environmental engineering, water treatment, wastewater, air pollution, solid waste management, environmental impact', 
        1985, 4.6, 110, 'Aisle 4 (Civil)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0470460641', 'Water Resources Engineering', 'Larry W. Mays', 'Civil Engineering', 4, 4, 
        'Comprehensive treatment of hydraulics, hydrology, open-channel flow, water distribution systems, flood routing, and reservoir management.',
        'hydrology, hydraulics, water resources, open channel flow, groundwater, flood routing, irrigation, dams', 
        2010, 4.6, 80, 'Aisle 4 (Civil)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073401126', 'Construction Planning, Equipment, and Methods', 'Robert L. Peurifoy & Clifford Schexnayder', 'Civil Engineering', 3, 3, 
        'Authoritative guide to construction equipment selection, earthmoving economics, concrete placement, project scheduling, and site safety.',
        'construction management, earthmoving, equipment economics, project scheduling, pert, cpm, site engineering', 
        2010, 4.5, 70, 'Aisle 4 (Civil)', 'Shelf B2', 'Rack 2');

-- 5. APPLIED MATHEMATICS & PURE SCIENCES - 8 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-8174091955', 'Higher Engineering Mathematics', 'B. S. Grewal', 'Mathematics', 6, 5, 
        'The definitive mathematics reference for all engineering undergraduate disciplines across India. Covers calculus, linear algebra, vector calculus, differential equations, and complex analysis.',
        'engineering mathematics, calculus, linear algebra, differential equations, laplace transform, fourier series, complex variables, vectors', 
        2014, 4.9, 320, 'Aisle 5 (Math & Sciences)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0470458365', 'Advanced Engineering Mathematics', 'Erwin Kreyszig', 'Mathematics', 5, 4, 
        'Global benchmark for applied mathematics in engineering and physics. Renowned for comprehensive coverage, clear explanations, and applied engineering exercises.',
        'advanced mathematics, kreyszig, pde, ode, linear algebra, vector analysis, complex analysis, numerical analysis', 
        2011, 4.8, 280, 'Aisle 5 (Math & Sciences)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0980232776', 'Linear Algebra and Its Applications', 'Gilbert Strang', 'Mathematics', 5, 4, 
        'Renowned MIT professor Gilbert Strang explains matrix theory, linear transformations, eigenvalues and eigenvectors, singular value decomposition (SVD), and positive definite matrices.',
        'linear algebra, matrices, eigenvalues, eigenvectors, svd, vector spaces, gilbert strang, machine learning math, transformations', 
        2016, 4.9, 290, 'Aisle 5 (Math & Sciences)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0321629111', 'Probability and Statistics for Engineers and Scientists', 'Ronald E. Walpole et al.', 'Mathematics', 5, 4, 
        'Clear introduction to probability theory, discrete and continuous random variables, statistical estimation, hypothesis testing, and regression analysis.',
        'probability, statistics, hypothesis testing, random variables, normal distribution, regression, data analysis, variance', 
        2011, 4.7, 180, 'Aisle 5 (Math & Sciences)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0135159552', 'University Physics with Modern Physics', 'Hugh D. Young & Roger A. Freedman', 'Physics', 5, 4, 
        'The gold standard calculus-based physics text. Covers classical mechanics, thermodynamics, electromagnetism, optics, relativity, and quantum physics.',
        'physics, mechanics, electromagnetism, thermodynamics, optics, modern physics, quantum mechanics, relativity', 
        2019, 4.8, 210, 'Aisle 5 (Math & Sciences)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073397924', 'Numerical Methods for Engineers', 'Steven C. Chapra & Raymond P. Canale', 'Mathematics', 4, 3, 
        'Instructs engineering students in the numerical techniques required to solve algebraic, differential, and integral equations using computers and programming.',
        'numerical methods, root finding, numerical integration, runge kutta, finite difference, interpolation, curve fitting', 
        2014, 4.7, 130, 'Aisle 5 (Math & Sciences)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073383095', 'Discrete Mathematics and Its Applications', 'Kenneth H. Rosen', 'Mathematics', 5, 4, 
        'Essential discrete mathematics for computer science. Covers propositional logic, set theory, combinatorics, graph theory, trees, and Boolean algebra.',
        'discrete mathematics, logic, combinatorics, graph theory, boolean algebra, induction, relations, algorithms', 
        2011, 4.8, 195, 'Aisle 5 (Math & Sciences)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1107189638', 'Introduction to Quantum Mechanics', 'David J. Griffiths & Darrell F. Schroeter', 'Physics', 4, 3, 
        'Standard undergraduate textbook on quantum mechanics. Covers the Schrodinger equation, wave functions, quantum states, perturbation theory, and atomic orbitals.',
        'quantum mechanics, wave function, schrodinger equation, quantum states, spin, hydrogen atom, perturbation theory', 
        2018, 4.9, 160, 'Aisle 5 (Math & Sciences)', 'Shelf B2', 'Rack 2');

-- 6. BUSINESS, MANAGEMENT & TECH INNOVATION - 5 Books
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0070144958', 'Essentials of Management', 'Harold Koontz & Heinz Weihrich', 'Management', 4, 3, 
        'Global management classic explaining the fundamental functions of management: planning, organizing, staffing, leading, and controlling in organizational environments.',
        'management, leadership, organizational behavior, planning, human resources, strategy, business administration', 
        2010, 4.6, 110, 'Aisle 6 (Management)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0073376356', 'Basics of Engineering Economy', 'Leland Blank & Anthony Tarquin', 'Management', 4, 3, 
        'Focuses on the financial evaluation of engineering projects: time value of money, present worth, rate of return analysis, depreciation, and cost-benefit ratios.',
        'engineering economics, cash flow, present worth, rate of return, depreciation, cost benefit, capital budgeting, financial analysis', 
        2013, 4.6, 95, 'Aisle 6 (Management)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0134444017', 'Operations Research: An Introduction', 'Hamdy A. Taha', 'Management', 4, 4, 
        'Comprehensive text on operations research and optimization techniques. Covers linear programming, simplex method, transportation problems, queuing theory, and game theory.',
        'operations research, linear programming, simplex method, optimization, queuing theory, game theory, network models', 
        2016, 4.7, 130, 'Aisle 6 (Management)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0307887894', 'The Lean Startup', 'Eric Ries', 'Management', 5, 4, 
        'How today''s entrepreneurs use continuous innovation to create radically successful businesses. Focuses on Minimum Viable Product (MVP), validated learning, and agile pivoting.',
        'entrepreneurship, lean startup, mvp, innovation, business strategy, product development, agile, agile business', 
        2011, 4.8, 250, 'Aisle 6 (Management)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1119385974', 'Project Management: A Systems Approach', 'Harold Kerzner', 'Management', 4, 3, 
        'Industry standard reference for project management professionals and engineering leaders. Covers work breakdown structures, risk management, scheduling, and stakeholder communication.',
        'project management, pmp, scheduling, risk management, wbs, agile project, governance, stakeholder management', 
        2017, 4.7, 140, 'Aisle 6 (Management)', 'Shelf B1', 'Rack 1');


-- 2. SEED MEMBERS (South Indian Demographic Profiles)
INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Satish Kumar', 'satish@sice.edu.in', '+91 98480 22338', '2023-08-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Bala Krishna', 'balakrishna@sice.edu.in', '+91 98491 11223', '2023-08-12', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Divya Reddy', 'divyareddy@sice.edu.in', '+91 99887 66554', '2023-09-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Soumya Naidu', 'soumya@sice.edu.in', '+91 98765 43210', '2023-09-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Lokesh Reddy', 'lokesh@sice.edu.in', '+91 97001 23456', '2023-10-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Jagan Chowdhary', 'jagan@sice.edu.in', '+91 94401 56789', '2023-10-15', 'SUSPENDED');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Ananya Sharma', 'ananya@sice.edu.in', '+91 91234 56780', '2024-01-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Jahnvi Rao', 'jahnvi@sice.edu.in', '+91 92345 67891', '2024-01-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Sravya Murthy', 'sravya@sice.edu.in', '+91 93456 78902', '2024-02-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Spoorthi Varma', 'spoorthi@sice.edu.in', '+91 94567 89013', '2024-02-15', 'ACTIVE');


-- 3. SEED HISTORICAL & ACTIVE TRANSACTIONS
-- Member 1 (Satish): Computer Science Focus
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (1, 1, '2026-06-01', '2026-06-15', '2026-06-14', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (3, 1, '2026-07-01', '2026-07-15', '2026-07-12', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (4, 1, '2026-08-01', '2026-08-15', '2026-08-15', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (1, 1, '2026-08-20', '2026-09-04', NULL, 'ISSUED');

-- Member 2 (Bala Krishna): AI & Data Systems Focus
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (8, 2, '2026-06-10', '2026-06-25', '2026-06-22', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (9, 2, '2026-07-05', '2026-07-20', '2026-07-18', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (11, 2, '2026-08-02', '2026-08-16', '2026-08-14', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (9, 2, '2026-08-25', '2026-09-08', NULL, 'ISSUED');

-- Member 3 (Divya Reddy): ECE Focus
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (16, 3, '2026-06-15', '2026-06-30', '2026-06-28', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (17, 3, '2026-07-10', '2026-07-24', '2026-07-20', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (18, 3, '2026-08-15', '2026-08-30', NULL, 'OVERDUE');

-- Member 4 (Soumya Naidu): Civil Focus
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (36, 4, '2026-07-01', '2026-07-15', '2026-07-14', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (38, 4, '2026-08-01', '2026-08-15', '2026-08-15', 'RETURNED');

-- Member 5 (Lokesh Reddy): Mechanical Focus
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (26, 5, '2026-07-12', '2026-07-26', '2026-07-25', 'RETURNED');

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (28, 5, '2026-08-10', '2026-08-24', '2026-08-22', 'RETURNED');


-- 4. SEED FINES
INSERT INTO fines (transaction_id, member_id, amount, status, payment_date, payment_method) 
VALUES (11, 3, 10.00, 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, status, payment_date, payment_method) 
VALUES (2, 1, 4.50, 'PAID', '2026-08-20', 'CARD');

INSERT INTO fines (transaction_id, member_id, amount, status, payment_date, payment_method) 
VALUES (8, 2, 2.00, 'PAID', '2026-08-15', 'UPI');


-- 5. SEED RESERVATIONS (Waitlist)
INSERT INTO reservations (book_id, member_id, reservation_date, status) 
VALUES (4, 4, '2026-08-28', 'PENDING');


-- 6. SEED SEARCH EVALUATION TELEMETRY LOGS
INSERT INTO search_eval_logs (query, search_mode, execution_time_ms, results_count, top_matched_book, created_at)
VALUES ('neural networks deep learning', 'SEMANTIC', 8, 3, 'Deep Learning', CURRENT_TIMESTAMP());

INSERT INTO search_eval_logs (query, search_mode, execution_time_ms, results_count, top_matched_book, created_at)
VALUES ('neural networks deep learning', 'KEYWORD', 3, 0, 'None', CURRENT_TIMESTAMP());

INSERT INTO search_eval_logs (query, search_mode, execution_time_ms, results_count, top_matched_book, created_at)
VALUES ('thermodynamics cengel heat transfer', 'SEMANTIC', 7, 2, 'Thermodynamics: An Engineering Approach', CURRENT_TIMESTAMP());
