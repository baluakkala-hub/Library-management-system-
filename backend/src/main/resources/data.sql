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
        'project management, pmp, scheduling, risk management, wbs, agile project, governance, stakeholder management', 
        2017, 4.7, 140, 'Aisle 6 (Management)', 'Shelf B1', 'Rack 1');

-- 7. ADDITIONAL EXPANDED CATALOG - 20 BOOKS ACROSS DISCIPLINES
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1543940176', 'Deep Learning for Computer Vision', 'Adrian Rosebrock', 'Artificial Intelligence', 4, 3, 
        'Comprehensive guide to building deep learning models for image classification, object detection, and face recognition using OpenCV, Keras, and TensorFlow.', 
        'deep learning, computer vision, cnn, opencv, image classification, object detection, yolo, neural networks', 
        2017, 4.8, 145, 'Aisle 1 (CSE/IT)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0262039246', 'Reinforcement Learning: An Introduction', 'Richard S. Sutton & Andrew G. Barto', 'Artificial Intelligence', 5, 4, 
        'The definitive reference on reinforcement learning. Covers Markov decision processes, dynamic programming, Monte Carlo methods, temporal-difference learning, and Q-learning.', 
        'reinforcement learning, rl, q-learning, markov decision processes, mdp, policy gradient, deep rl, bellman equation', 
        2018, 4.9, 280, 'Aisle 1 (CSE/IT)', 'Shelf C2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1107002173', 'Quantum Computation and Quantum Information', 'Michael A. Nielsen & Isaac L. Chuang', 'Computer Science', 4, 3, 
        'The foundational textbook on quantum computing. Introduces qubits, quantum circuits, quantum Fourier transform, Shor''s factoring algorithm, and Grover''s search algorithm.', 
        'quantum computing, qubits, quantum algorithms, shor algorithm, grover search, quantum information, quantum entanglement', 
        2010, 4.9, 215, 'Aisle 1 (CSE/IT)', 'Shelf D2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1491929124', 'Site Reliability Engineering: How Google Runs Production Systems', 'Niall Richard Murphy et al.', 'Computer Science', 4, 3, 
        'Members of the Google SRE team explain how Google builds, deploys, monitors, and maintains some of the world''s largest and most reliable computing systems.', 
        'sre, site reliability engineering, devops, distributed systems, monitoring, slo, sli, error budgets, incident management', 
        2016, 4.8, 190, 'Aisle 1 (CSE/IT)', 'Shelf D1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1098103248', 'Natural Language Processing with Transformers', 'Lewis Tunstall, Leandro von Werra & Thomas Wolf', 'Artificial Intelligence', 4, 4, 
        'Hands-on guide to building state-of-the-art NLP models with Hugging Face Transformers. Covers BERT, GPT, T5, text classification, named entity recognition, and question answering.', 
        'nlp, transformers, hugging face, bert, gpt, large language models, llm, attention mechanism, text processing', 
        2022, 4.9, 220, 'Aisle 1 (CSE/IT)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0321547743', 'CMOS VLSI Design: A Circuits and Systems Perspective', 'Neil H. E. Weste & David Harris', 'Electrical Engineering', 5, 4, 
        'The standard textbook on CMOS VLSI design. Explains circuit design, transistor layout, logical effort, timing analysis, dynamic logic, and modern manufacturing technology.', 
        'vlsi, cmos, integrated circuits, circuit design, transistor layout, verilog, logic design, semiconductor fabrication', 
        2010, 4.8, 160, 'Aisle 2 (ECE/EEE)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0130422323', 'Wireless Communications: Principles and Practice', 'Theodore S. Rappaport', 'Electrical Engineering', 4, 3, 
        'Covers cellular radio fundamentals, path loss, multipath propagation, small-scale fading, equalization, diversity techniques, and modern 4G/5G mobile standards.', 
        'wireless communications, cellular systems, fading, multipath, rf, 4g, 5g, modulation, antenna diversity, propagation', 
        2002, 4.7, 135, 'Aisle 2 (ECE/EEE)', 'Shelf C2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0996025515', 'Internet of Things: A Hands-On Approach', 'Arshdeep Bahga & Vijay Madisetti', 'Electrical Engineering', 4, 4, 
        'Practical guide to IoT design and deployment using Raspberry Pi, Arduino, MQTT, CoAP, and cloud analytics. Covers edge computing, sensor interfacing, and smart campus solutions.', 
        'iot, internet of things, raspberry pi, arduino, sensors, mqtt, embedded systems, edge computing, smart systems', 
        2014, 4.6, 110, 'Aisle 2 (ECE/EEE)', 'Shelf D1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1292251073', 'Mechatronics: Electronic Control Systems in Mechanical and Electrical Engineering', 'William Bolton', 'Mechanical Engineering', 5, 4, 
        'Comprehensive introduction to mechatronics combining mechanical engineering with electronics and intelligent computer control. Covers sensors, actuators, PLCs, and microcontrollers.', 
        'mechatronics, sensors, actuators, plcs, microcontrollers, control engineering, robotics, electro-mechanical', 
        2019, 4.7, 125, 'Aisle 3 (Mechanical)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0080966328', 'Aerodynamics for Engineering Students', 'E. L. Houghton & P. W. Carpenter', 'Mechanical Engineering', 4, 3, 
        'Classic engineering text on low-speed and high-speed aerodynamics. Covers potential flow, airfoil theory, finite wing theory, boundary layers, and compressible supersonic flows.', 
        'aerodynamics, airfoil, lift, drag, compressible flow, boundary layer, supersonic, fluid dynamics, aeronautics', 
        2012, 4.7, 95, 'Aisle 3 (Mechanical)', 'Shelf C2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0979004902', 'Finite Element Procedures', 'Klaus-Jürgen Bathe', 'Mechanical Engineering', 4, 3, 
        'The definitive reference on the finite element method (FEM) for linear and nonlinear structural analysis, solid mechanics, and heat conduction equations.', 
        'finite element method, fem, fea, structural mechanics, numerical analysis, stress analysis, elasticity, solid mechanics', 
        2006, 4.8, 140, 'Aisle 3 (Mechanical)', 'Shelf D1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0071759038', 'Bridge Engineering: Design, Rehabilitation, and Maintenance', 'Demetrios E. Tonias & Jim J. Zhao', 'Civil Engineering', 4, 3, 
        'Comprehensive guide to bridge engineering according to AASHTO specifications. Covers superstructures, substructures, piers, abutments, bridge seismic design, and fatigue.', 
        'bridge engineering, aashto, prestressed concrete, steel girders, piers, seismic design, civil engineering, infrastructure', 
        2012, 4.6, 85, 'Aisle 4 (Civil)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0849314391', 'Earthquake Engineering: From Seismology to Performance-Based Design', 'Yousef Bozorgnia & Vitelmo V. Bertero', 'Civil Engineering', 4, 3, 
        'In-depth coverage of engineering seismology, ground motion records, response spectra, ductile detailing, base isolation, and seismic retrofitting of buildings.', 
        'earthquake engineering, seismic design, response spectrum, base isolation, structural dynamics, building codes, retrofitting', 
        2004, 4.8, 90, 'Aisle 4 (Civil)', 'Shelf C1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0198072393', 'Remote Sensing and GIS', 'Basudeb Bhatta', 'Civil Engineering', 5, 4, 
        'Standard university textbook introducing the principles of satellite remote sensing, photogrammetry, image interpretation, GIS spatial analysis, and GPS surveying.', 
        'remote sensing, gis, satellite imagery, photogrammetry, spatial analysis, cartography, geomatics, gps', 
        2011, 4.7, 115, 'Aisle 4 (Civil)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0387310732', 'Pattern Recognition and Machine Learning', 'Christopher M. Bishop', 'Mathematics', 5, 4, 
        'The premier textbook on pattern recognition and Bayesian machine learning. Covers Bayesian networks, Gaussian processes, expectation-maximization, and variational inference.', 
        'pattern recognition, machine learning, bayesian inference, gaussian processes, graphical models, probability, statistics', 
        2006, 4.9, 310, 'Aisle 5 (Math & Sciences)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0521642989', 'Information Theory, Inference, and Learning Algorithms', 'David J. C. MacKay', 'Mathematics', 4, 3, 
        'Cambridge classic connecting information theory, coding theory, statistical physics, and machine learning. Covers Shannon entropy, error-correcting codes, and Monte Carlo methods.', 
        'information theory, shannon entropy, error correcting codes, bayesian inference, monte carlo, neural networks, coding theory', 
        2003, 4.9, 205, 'Aisle 5 (Math & Sciences)', 'Shelf C1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0123821881', 'Statistical Mechanics', 'R. K. Pathria & Paul D. Beale', 'Physics', 4, 3, 
        'Graduate textbook on equilibrium and non-equilibrium statistical mechanics. Covers microcanonical, canonical, and grand canonical ensembles, Bose-Einstein condensation, and Fermi gases.', 
        'statistical mechanics, thermodynamics, ensembles, bose einstein, fermi dirac, partition functions, phase transitions, physics', 
        2011, 4.8, 130, 'Aisle 5 (Math & Sciences)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-9353166526', 'Financial Management: Theory and Practice', 'Prasanna Chandra', 'Management', 5, 4, 
        'India''s premier finance textbook for MBA and management students. Covers working capital management, capital structure theories, valuation, derivatives, and portfolio analysis.', 
        'financial management, corporate finance, capital budgeting, working capital, portfolio management, valuation, mba finance', 
        2019, 4.8, 230, 'Aisle 6 (Management)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0133800203', 'Supply Chain Management: Strategy, Planning, and Operation', 'Sunil Chopra & Peter Meindl', 'Management', 4, 3, 
        'Provides a strategic framework to guide decisions about logistics, inventory control, sourcing, transport, and facility location in global supply networks.', 
        'supply chain, logistics, inventory management, sourcing, operations, procurement, bullwhip effect, distribution', 
        2015, 4.7, 160, 'Aisle 6 (Management)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0133856460', 'Marketing Management', 'Philip Kotler & Kevin Lane Keller', 'Management', 5, 4, 
        'The gold standard world-renowned marketing textbook. Covers market segmentation, branding, consumer behavior, pricing strategies, digital marketing, and omni-channel distribution.', 
        'marketing management, branding, market research, consumer behavior, pricing strategies, segmentation, marketing strategy', 
        2015, 4.8, 280, 'Aisle 6 (Management)', 'Shelf B2', 'Rack 2');

-- 8. NOVELS & LITERARY CLASSICS (BRINGING CATALOG TO EXACTLY 100 BOOKS)
INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0441172719', 'Dune', 'Frank Herbert', 'Science Fiction', 6, 5, 
        'Set on the desert planet Arrakis, Dune tells the story of Paul Atreides, heir to a noble family in a galactic empire, battling for control of the universe''s most valuable substance: the spice melange.', 
        'dune, arrakis, paul atreides, spice, sci-fi classic, science fiction, desert, empire, frank herbert', 
        1965, 4.9, 450, 'Aisle 7 (Literature & Fiction)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0593098233', 'Dune Messiah', 'Frank Herbert', 'Science Fiction', 5, 4, 
        'The direct sequel to Dune. Paul Atreides has become Emperor of the known universe, facing political conspiracies, religious jihad, and tragic prophecies.', 
        'dune, dune messiah, arrakis, muad dib, paul atreides, science fiction, prophecy, empire', 
        1969, 4.7, 280, 'Aisle 7 (Literature & Fiction)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0553293357', 'Foundation', 'Isaac Asimov', 'Science Fiction', 5, 4, 
        'The first novel in Asimov''s legendary series. Mathematician Hari Seldon develops psychohistory to preserve knowledge and civilization through the fall of the Galactic Empire.', 
        'foundation, isaac asimov, psychohistory, hari seldon, galactic empire, science fiction classic, space opera', 
        1951, 4.8, 380, 'Aisle 7 (Literature & Fiction)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0451524935', '1984', 'George Orwell', 'Classic Literature', 6, 5, 
        'The seminal dystopian novel depicting a totalitarian regime under Big Brother, surveillance, thoughtcrime, and the fight of Winston Smith for individual freedom.', 
        '1984, george orwell, dystopia, big brother, totalitarianism, thoughtcrime, classic, surveillance', 
        1949, 4.9, 520, 'Aisle 7 (Literature & Fiction)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0060850524', 'Brave New World', 'Aldous Huxley', 'Classic Literature', 5, 4, 
        'A prophetic vision of a dehumanized, technologically controlled totalitarian society based on consumerism, psychological conditioning, and genetic engineering.', 
        'brave new world, aldous huxley, dystopia, genetic engineering, classic literature, philosophy', 
        1932, 4.7, 340, 'Aisle 7 (Literature & Fiction)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 'Classic Literature', 6, 5, 
        'Pulitzer Prize-winning novel exploring racial injustice, compassion, and innocence in the American Deep South through the eyes of young Scout Finch and her lawyer father Atticus.', 
        'to kill a mockingbird, harper lee, atticus finch, justice, southern gothic, american classic, pulitzer', 
        1960, 4.9, 490, 'Aisle 7 (Literature & Fiction)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0743273565', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Literature', 5, 4, 
        'The quintessential story of the Jazz Age, exploring wealth, ambition, obsession, and the elusive American Dream through the mysterious millionaire Jay Gatsby.', 
        'the great gatsby, fitzgerald, jazz age, american dream, classic, daisy buchanan, 1920s', 
        1925, 4.6, 410, 'Aisle 7 (Literature & Fiction)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0547928210', 'The Lord of the Rings: The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fantasy & Fiction', 6, 5, 
        'The first part of Tolkien''s masterwork epic fantasy. Frodo Baggins begins his perilous quest across Middle-earth to destroy the One Ring in the fires of Mount Doom.', 
        'lord of the rings, tolkien, fellowship of the ring, frodo, gandalf, middle earth, high fantasy, epic', 
        1954, 4.9, 610, 'Aisle 7 (Literature & Fiction)', 'Shelf B2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0547928227', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy & Fiction', 5, 4, 
        'The delightful prelude to The Lord of the Rings. Follows Bilbo Baggins as he is swept into an epic quest to reclaim the lost dwarf kingdom of Erebor from the dragon Smaug.', 
        'the hobbit, tolkien, bilbo baggins, smaug, middle earth, fantasy classic, adventure, ring', 
        1937, 4.8, 480, 'Aisle 7 (Literature & Fiction)', 'Shelf C1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0593135204', 'Project Hail Mary', 'Andy Weir', 'Science Fiction', 5, 4, 
        'A lone astronaut on an interstellar survival mission must use science, physics, and unexpected friendship with an extraterrestrial to save humanity from solar extinction.', 
        'project hail mary, andy weir, interstellar, science fiction, space exploration, physics, hard sci-fi, rocky', 
        2021, 4.9, 390, 'Aisle 7 (Literature & Fiction)', 'Shelf C1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0553418026', 'The Martian', 'Andy Weir', 'Science Fiction', 5, 4, 
        'Astronaut Mark Watney is stranded alone on Mars after a dust storm. Using his engineering ingenuity and botany skills, he fights to survive against all odds.', 
        'the martian, andy weir, mark watney, mars survival, hard sci-fi, engineering, botany, space', 
        2014, 4.8, 440, 'Aisle 7 (Literature & Fiction)', 'Shelf C2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0441569595', 'Neuromancer', 'William Gibson', 'Science Fiction', 4, 3, 
        'The definitive cyberpunk masterpiece that coined the term cyberspace. Follows washed-up hacker Case hired for a high-stakes hack against an omnipresent artificial intelligence.', 
        'neuromancer, william gibson, cyberpunk, cyberspace, ai, matrix, hacking, sci-fi noir', 
        1984, 4.7, 310, 'Aisle 7 (Literature & Fiction)', 'Shelf C2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1451673319', 'Fahrenheit 451', 'Ray Bradbury', 'Classic Literature', 5, 4, 
        'In a dystopian future where books are forbidden and burned by firemen, Guy Montag begins questioning everything about censorship, media consumption, and intellectual freedom.', 
        'fahrenheit 451, ray bradbury, censorship, book burning, dystopia, classic, guy montag', 
        1953, 4.7, 360, 'Aisle 7 (Literature & Fiction)', 'Shelf D1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0062315007', 'The Alchemist', 'Paulo Coelho', 'Contemporary Fiction', 6, 5, 
        'An inspiring philosophical tale about an Andalusian shepherd boy named Santiago who journeys to the Egyptian pyramids in search of treasure and his personal legend.', 
        'the alchemist, paulo coelho, personal legend, philosophy, destiny, inspiring, adventure', 
        1988, 4.8, 590, 'Aisle 7 (Literature & Fiction)', 'Shelf D1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0812976533', 'Midnight''s Children', 'Salman Rushdie', 'Indian Literature', 5, 4, 
        'Winner of the Booker Prize and Best of the Booker. A magical realist historical saga following children born at the midnight stroke of India''s independence.', 
        'midnights children, salman rushdie, booker prize, magical realism, indian history, independence, modern classic', 
        1981, 4.8, 320, 'Aisle 7 (Literature & Fiction)', 'Shelf D2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0812979657', 'The God of Small Things', 'Arundhati Roy', 'Indian Literature', 5, 4, 
        'Booker Prize-winning lyrical novel set in Kerala, chronicling the childhood experiences of fraternal twins and how the smallest events can overturn families and traditions.', 
        'the god of small things, arundhati roy, booker prize, kerala, ayemenem, indian literature, lyrical', 
        1997, 4.8, 340, 'Aisle 7 (Literature & Fiction)', 'Shelf D2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-1416562603', 'The White Tiger', 'Aravind Adiga', 'Indian Literature', 5, 4, 
        'Winner of the Man Booker Prize. A dark, comic, fast-paced tale of Balram Halwai, a village boy who rises from driver to successful entrepreneur in modern Bangalore.', 
        'the white tiger, aravind adiga, booker prize, bangalore, social mobility, modern india, satire', 
        2008, 4.6, 290, 'Aisle 8 (Special Collections)', 'Shelf A1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0060786526', 'A Suitable Boy', 'Vikram Seth', 'Indian Literature', 4, 3, 
        'One of the longest English novels in history, set in post-independence India. An intimate epic of four families and Mrs. Rupa Mehra''s quest to arrange a suitable match for her daughter.', 
        'a suitable boy, vikram seth, indian english literature, post independence, epic novel, family saga', 
        1993, 4.7, 210, 'Aisle 8 (Special Collections)', 'Shelf A1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0143039648', 'The Guide', 'R. K. Narayan', 'Indian Literature', 5, 4, 
        'Set in fictional Malgudi, this Sahitya Akademi Award-winning masterpiece follows tour guide Raju who through bizarre twists of fate becomes revered as a spiritual guru.', 
        'the guide, rk narayan, malgudi, sahitya akademi, classic indian fiction, transformation, humor', 
        1958, 4.8, 270, 'Aisle 8 (Special Collections)', 'Shelf A2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0141439518', 'Pride and Prejudice', 'Jane Austen', 'Classic Literature', 6, 5, 
        'The timeless romantic comedy of manners depicting the tempestuous courtship between the spirited Elizabeth Bennet and the proud aristocratic Mr. Darcy.', 
        'pride and prejudice, jane austen, elizabeth bennet, mr darcy, classic romance, regency, wit', 
        1813, 4.9, 640, 'Aisle 8 (Special Collections)', 'Shelf A2', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0143058144', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Classic Literature', 5, 4, 
        'A psychological masterpiece exploring the moral dilemmas of Rodion Raskolnikov, an impoverished ex-student in St. Petersburg who murders a pawnbroker to test his theories of greatness.', 
        'crime and punishment, dostoevsky, raskolnikov, st petersburg, psychological novel, guilt, redemption', 
        1866, 4.8, 380, 'Aisle 8 (Special Collections)', 'Shelf B1', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0316769488', 'The Catcher in the Rye', 'J. D. Salinger', 'Classic Literature', 5, 4, 
        'The classic exploration of teenage alienation, loss of innocence, and identity crisis through the rebellious voice of Holden Caulfield wandering New York City.', 
        'the catcher in the rye, jd salinger, holden caulfield, alienation, coming of age, classic literature', 
        1951, 4.6, 410, 'Aisle 8 (Special Collections)', 'Shelf B1', 'Rack 2');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0765382030', 'The Three-Body Problem', 'Cixin Liu', 'Science Fiction', 5, 4, 
        'Hugo Award-winning hard sci-fi epic set against the backdrop of China''s Cultural Revolution, culminating in humanity''s first contact with an alien civilization from Alpha Centauri.', 
        'the three body problem, cixin liu, hugo award, hard sci-fi, first contact, physics, trisolaris', 
        2008, 4.8, 350, 'Aisle 8 (Special Collections)', 'Shelf B2', 'Rack 1');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies, description, keywords, publication_year, average_rating, ratings_count, aisle, shelf, column_rack) 
VALUES ('978-0062316097', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'General Non-Fiction', 6, 5, 
        'A groundbreaking historical exploration spanning 70,000 years of human evolution, the Cognitive Revolution, the Agricultural Revolution, and the Scientific Revolution.', 
        'sapiens, yuval noah harari, anthropology, evolution, human history, non-fiction, cognitive revolution', 
        2014, 4.9, 580, 'Aisle 8 (Special Collections)', 'Shelf B2', 'Rack 2');


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
VALUES ('Jagan Chowdhary', 'jagan@sice.edu.in', '+91 94401 56789', '2023-10-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Ananya Sharma', 'ananya@sice.edu.in', '+91 91234 56780', '2024-01-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Jahnvi Rao', 'jahnvi@sice.edu.in', '+91 92345 67891', '2024-01-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Sravya Murthy', 'sravya@sice.edu.in', '+91 93456 78902', '2024-02-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status) 
VALUES ('Spoorthi Varma', 'spoorthi@sice.edu.in', '+91 94567 89013', '2024-02-15', 'ACTIVE');

-- Additional 30 Members (Pan-Indian Demographic Fusion)
INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Aarav Patel', 'aarav.patel@sice.edu.in', '+91 98250 11223', '2024-03-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Rohan Mukherjee', 'rohan.mukherjee@sice.edu.in', '+91 98301 44556', '2024-03-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Priya Nambiar', 'priya.nambiar@sice.edu.in', '+91 94471 22334', '2024-03-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Vikramaditya Singh', 'vikram.singh@sice.edu.in', '+91 94140 55667', '2024-03-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Sneha Kulkarni', 'sneha.kulkarni@sice.edu.in', '+91 98220 77889', '2024-03-20', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Tanvi Deshmukh', 'tanvi.deshmukh@sice.edu.in', '+91 98225 99001', '2024-04-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Harpreet Kaur', 'harpreet.kaur@sice.edu.in', '+91 98140 33445', '2024-04-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Meera Iyer', 'meera.iyer@sice.edu.in', '+91 94440 66778', '2024-04-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Aditya Varma', 'aditya.varma@sice.edu.in', '+91 98481 88990', '2024-04-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Siddharth Nair', 'siddharth.nair@sice.edu.in', '+91 94475 12345', '2024-05-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Ishaan Chatterjee', 'ishaan.chatterjee@sice.edu.in', '+91 98310 23456', '2024-05-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Riya Sengupta', 'riya.sengupta@sice.edu.in', '+91 98315 34567', '2024-05-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Arjun Pillai', 'arjun.pillai@sice.edu.in', '+91 94460 45678', '2024-05-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Kavya Sundaram', 'kavya.sundaram@sice.edu.in', '+91 94445 56789', '2024-06-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Devendra Rathore', 'devendra.rathore@sice.edu.in', '+91 94145 67890', '2024-06-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Pooja Hegde', 'pooja.hegde@sice.edu.in', '+91 98450 78901', '2024-06-10', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Nikhil Joshi', 'nikhil.joshi@sice.edu.in', '+91 98230 89012', '2024-06-15', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Neha Bhattacharya', 'neha.bhattacharya@sice.edu.in', '+91 98320 90123', '2024-07-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Chirag Mehta', 'chirag.mehta@sice.edu.in', '+91 98255 01234', '2024-07-05', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Shalini Menon', 'shalini.menon@sice.edu.in', '+91 94465 12340', '2024-07-10', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Abhimanyu Das', 'abhimanyu.das@sice.edu.in', '+91 94370 23451', '2024-07-15', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Ritika Barua', 'ritika.barua@sice.edu.in', '+91 94350 34562', '2024-08-01', 'ACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Gurpreet Singh', 'gurpreet.singh@sice.edu.in', '+91 98145 45673', '2024-08-05', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Pranav Venkatesh', 'pranav.venkatesh@sice.edu.in', '+91 94448 56784', '2024-08-10', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Swati Mahajan', 'swati.mahajan@sice.edu.in', '+91 94191 67895', '2024-08-15', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Tenzin Norbu', 'tenzin.norbu@sice.edu.in', '+91 94360 78906', '2024-09-01', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Rajeshwari Somayaji', 'rajeshwari.s@sice.edu.in', '+91 98455 89017', '2024-09-05', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Mayank Tripathi', 'mayank.tripathi@sice.edu.in', '+91 94150 90128', '2024-09-10', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Deepali Bora', 'deepali.bora@sice.edu.in', '+91 94355 01239', '2024-09-15', 'INACTIVE');

INSERT INTO members (name, email, phone, membership_date, status)
VALUES ('Farhan Qureshi', 'farhan.qureshi@sice.edu.in', '+91 98260 12349', '2024-10-01', 'INACTIVE');


-- 3. SEED HISTORICAL & ACTIVE TRANSACTIONS (Simulated for 20 Active Students with Personalised Academic Profiles)
-- Satish Kumar (ID: 1) - CS Focus (Clean Code, Effective Java, OS)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (1, 1, '2026-06-01', '2026-06-15', '2026-06-14', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (3, 1, '2026-07-01', '2026-07-15', '2026-07-12', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (5, 1, '2026-09-18', '2026-10-02', NULL, 'ISSUED');

-- Bala Krishna (ID: 2) - AI & Data Science (Deep Learning, Transformers, Hands-On ML)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (9, 2, '2026-06-10', '2026-06-24', '2026-06-22', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (65, 2, '2026-07-15', '2026-07-29', '2026-07-28', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (11, 2, '2026-09-20', '2026-10-04', NULL, 'ISSUED');

-- Divya Reddy (ID: 3) - ECE Focus (CMOS VLSI, Microelectronics)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (66, 3, '2026-06-05', '2026-06-19', '2026-06-18', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (15, 3, '2026-08-10', '2026-08-24', NULL, 'OVERDUE');

-- Soumya Naidu (ID: 4) - Civil Engineering (Structural Analysis, Concrete Structures)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (35, 4, '2026-06-12', '2026-06-26', '2026-06-25', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (37, 4, '2026-09-15', '2026-09-29', NULL, 'ISSUED');

-- Lokesh Reddy (ID: 5) - Mechanical Engineering (Thermodynamics, Robotics)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (25, 5, '2026-07-01', '2026-07-15', '2026-07-14', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (32, 5, '2026-09-19', '2026-10-03', NULL, 'ISSUED');

-- Ananya Sharma (ID: 7) - CS & Cloud Systems (Compilers, Cloud Native Patterns, SRE)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (13, 7, '2026-06-15', '2026-06-29', '2026-06-28', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (14, 7, '2026-07-20', '2026-08-03', '2026-08-02', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (64, 7, '2026-09-22', '2026-10-06', NULL, 'ISSUED');

-- Jahnvi Rao (ID: 8) - Data Science (Deep Learning, Data-Intensive Applications)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (9, 8, '2026-07-05', '2026-07-19', '2026-07-18', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (8, 8, '2026-09-16', '2026-09-30', NULL, 'ISSUED');

-- Sravya Murthy (ID: 9) - MBA (Financial Management, The Lean Startup)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (53, 9, '2026-06-20', '2026-07-04', '2026-07-04', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (55, 9, '2026-09-18', '2026-10-02', NULL, 'ISSUED');

-- Spoorthi Varma (ID: 10) - IT (Algorithms CLRS, Discrete Mathematics)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (4, 10, '2026-06-08', '2026-06-22', '2026-06-21', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (49, 10, '2026-09-21', '2026-10-05', NULL, 'ISSUED');

-- Aarav Patel (ID: 11) - Mechanical (Aerodynamics, Finite Element Procedures)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (70, 11, '2026-07-10', '2026-07-24', '2026-07-24', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (71, 11, '2026-09-22', '2026-10-06', NULL, 'ISSUED');

-- Rohan Mukherjee (ID: 12) - CS (Transformers, Reinforcement Learning)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (65, 12, '2026-06-14', '2026-06-28', '2026-06-27', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (62, 12, '2026-09-19', '2026-10-03', NULL, 'ISSUED');

-- Priya Nambiar (ID: 13) - ECE (Signals & Systems, Wireless Communications)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (17, 13, '2026-06-18', '2026-07-02', '2026-07-01', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (67, 13, '2026-09-17', '2026-10-01', NULL, 'ISSUED');

-- Vikramaditya Singh (ID: 14) - Civil (Bridge Engineering, Earthquake Engineering)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (72, 14, '2026-07-05', '2026-07-19', '2026-07-19', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (73, 14, '2026-09-21', '2026-10-05', NULL, 'ISSUED');

-- Sneha Kulkarni (ID: 15) - Data Science (Pattern Recognition, Sapiens)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (61, 15, '2026-06-22', '2026-07-06', '2026-07-05', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (100, 15, '2026-09-23', '2026-10-07', NULL, 'ISSUED');

-- Tanvi Deshmukh (ID: 16) - Mech/Control (Mechatronics, Modern Control Engineering)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (69, 16, '2026-06-28', '2026-07-12', '2026-07-11', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (20, 16, '2026-09-20', '2026-10-04', NULL, 'ISSUED');

-- Meera Iyer (ID: 18) - Sci-Fi / Space Classics (Dune, Dune Messiah, Foundation)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (77, 18, '2026-07-01', '2026-07-15', '2026-07-15', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (78, 18, '2026-07-20', '2026-08-03', '2026-08-03', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (79, 18, '2026-09-22', '2026-10-06', NULL, 'ISSUED');

-- Aditya Varma (ID: 19) - Indian Literature & Modern Classics (The Guide, Midnight's Children)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (95, 19, '2026-06-15', '2026-06-29', '2026-06-28', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (91, 19, '2026-09-21', '2026-10-05', NULL, 'ISSUED');

-- Siddharth Nair (ID: 20) - MBA (Operations Research, Project Management)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (57, 20, '2026-06-30', '2026-07-14', '2026-07-13', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (56, 20, '2026-09-18', '2026-10-02', NULL, 'ISSUED');

-- Ishaan Chatterjee (ID: 21) - Quantum & Cyberpunk (Quantum Computation, Neuromancer)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (63, 21, '2026-07-05', '2026-07-19', '2026-07-18', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (88, 21, '2026-09-23', '2026-10-07', NULL, 'ISSUED');

-- Ritika Barua (ID: 32) - Sci-Fi Hard Fiction (The Martian, Project Hail Mary)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (87, 32, '2026-07-12', '2026-07-26', '2026-07-25', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (86, 32, '2026-09-20', '2026-10-04', NULL, 'ISSUED');

-- Jagan Chowdhary (ID: 6) - Electrical (Electric Circuits, Power Electronics)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (19, 6, '2026-06-15', '2026-06-29', '2026-07-06', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (21, 6, '2026-09-18', '2026-10-02', NULL, 'ISSUED');

-- Harpreet Kaur (ID: 17) - Electrical (Communication Systems, Antenna Theory)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (24, 17, '2026-08-15', '2026-08-29', NULL, 'OVERDUE');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (25, 17, '2026-07-01', '2026-07-15', '2026-07-14', 'RETURNED');

-- Riya Sengupta (ID: 22) - Data Science (Deep Learning, Data-Intensive Applications)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (9, 22, '2026-06-20', '2026-07-04', '2026-07-09', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (8, 22, '2026-09-20', '2026-10-04', NULL, 'ISSUED');

-- Arjun Pillai (ID: 23) - Electrical (Embedded Systems, DSP)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (23, 23, '2026-07-02', '2026-07-16', '2026-07-15', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (18, 23, '2026-09-19', '2026-10-03', NULL, 'ISSUED');

-- Kavya Sundaram (ID: 24) - Civil (Surveying and Levelling, Transportation)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (39, 24, '2026-06-10', '2026-06-24', '2026-07-04', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (40, 24, '2026-09-15', '2026-09-29', NULL, 'ISSUED');

-- Devendra Rathore (ID: 25) - Mechanical (IC Engines, Manufacturing Technology)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (34, 25, '2026-07-05', '2026-07-19', '2026-07-18', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (35, 25, '2026-09-21', '2026-10-05', NULL, 'ISSUED');

-- Pooja Hegde (ID: 26) - IT (Computer Networks, Database Systems)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (6, 26, '2026-06-18', '2026-07-02', '2026-07-10', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (7, 26, '2026-09-17', '2026-10-01', NULL, 'ISSUED');

-- Nikhil Joshi (ID: 27) - CSE (Computer Systems, Design Patterns)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (12, 27, '2026-07-10', '2026-07-24', '2026-07-23', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (2, 27, '2026-09-22', '2026-10-06', NULL, 'ISSUED');

-- Neha Bhattacharya (ID: 28) - AI & Robotics (Artificial Intelligence AIMA, Reinforcement Learning)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (10, 28, '2026-06-25', '2026-07-09', '2026-07-15', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (62, 28, '2026-09-18', '2026-10-02', NULL, 'ISSUED');

-- Chirag Mehta (ID: 29) - MBA (Essentials of Management, Strategic Management)
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (52, 29, '2026-07-08', '2026-07-22', '2026-07-21', 'RETURNED');
INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, status)
VALUES (60, 29, '2026-09-20', '2026-10-04', NULL, 'ISSUED');


-- 4. SEED FINES (IN INR WITH REALISTIC UNIVERSITY REASONS & LATE SUBMISSIONS)
INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (8, 3, 70.00, 'Overdue Book Return (14 Days Overdue - Microelectronic Circuits)', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (14, 7, 150.00, 'Damaged Textbook - Water damaged pages on Cloud Native Patterns', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (16, 8, 100.00, 'Torn / Missing Index Pages in Deep Learning', 'PAID', '2026-09-10', 'UPI');

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (22, 11, 50.00, 'Defaced Book - Heavy Pen/Highlighter Markings in Aerodynamics', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (28, 14, 80.00, 'Late Return of High-Demand Reference Material (Bridge Engineering)', 'PAID', '2026-09-15', 'CARD');

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (34, 18, 35.00, 'Late Return Penalty - Dune (Special Illustrated Edition)', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 20, 60.00, 'Lost Library Barcode Tag Replacement Fee', 'PAID', '2026-09-12', 'CASH');

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 6, 35.00, 'Late submission - 7 days overdue return on Electric Circuits', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 17, 45.00, 'Overdue fine - Late submission pending on Communication Systems', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 22, 25.00, 'Late submission fee - 5 days overdue return on Deep Learning', 'PAID', '2026-07-10', 'UPI');

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 24, 50.00, 'Late submission penalty - 10 days overdue on Surveying and Levelling', 'UNPAID', NULL, NULL);

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 26, 40.00, 'Late submission & overdue fine - 8 days late return on Computer Networks', 'PAID', '2026-07-11', 'CARD');

INSERT INTO fines (transaction_id, member_id, amount, reason, status, payment_date, payment_method) 
VALUES (NULL, 28, 30.00, 'Late submission fine - 6 days late on Artificial Intelligence', 'UNPAID', NULL, NULL);


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


-- ==============================================================================
-- 7. SEED USERS & CREDENTIALS (SPRING SECURITY BCRYPT-HASHED PASSWORDS)
-- Admin: admin / admin123
-- Students: satish, balakrishna, divya, etc. / student123
-- ==============================================================================
INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('admin', 'LIBRARY@admin.com', '$2a$12$cO7Pn3F8RRjOa9sPWMyeCOYoQlwOOdJf0TA4bslmalWIMJUMHIq76', 'ROLE_ADMIN', 'Chief Librarian', 'ADM', 'Central Library Administration', NULL, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('satish', 'satish@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Satish Kumar', 'SK', 'Computer Science & Engineering', 1, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('balakrishna', 'balakrishna@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Bala Krishna', 'BK', 'AI & Data Engineering', 2, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('divya', 'divyareddy@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Divya Reddy', 'DR', 'Electronics & Communication', 3, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('soumya', 'soumya@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Soumya Naidu', 'SN', 'Civil Engineering', 4, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('lokesh', 'lokesh@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Lokesh Reddy', 'LR', 'Mechanical Engineering', 5, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('jagan', 'jagan@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Jagan Chowdhary', 'JC', 'Electrical & Electronics', 6, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('ananya', 'ananya@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Ananya Sharma', 'AS', 'Computer Science & Engineering', 7, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('jahnvi', 'jahnvi@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Jahnvi Rao', 'JR', 'Data Science & Analytics', 8, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('sravya', 'sravya@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Sravya Murthy', 'SM', 'Management Studies (MBA)', 9, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('spoorthi', 'spoorthi@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Spoorthi Varma', 'SV', 'Information Technology', 10, true);

-- Additional 30 Student Users (Password: student123)
INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('aarav', 'aarav.patel@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Aarav Patel', 'AP', 'Mechanical Engineering', 11, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('rohan', 'rohan.mukherjee@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Rohan Mukherjee', 'RM', 'Computer Science & Engineering', 12, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('priya', 'priya.nambiar@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Priya Nambiar', 'PN', 'Electronics & Communication', 13, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('vikramaditya', 'vikram.singh@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Vikramaditya Singh', 'VS', 'Civil Engineering', 14, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('sneha', 'sneha.kulkarni@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Sneha Kulkarni', 'SK', 'Data Science & Analytics', 15, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('tanvi', 'tanvi.deshmukh@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Tanvi Deshmukh', 'TD', 'AI & Robotics', 16, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('harpreet', 'harpreet.kaur@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Harpreet Kaur', 'HK', 'Electrical & Electronics', 17, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('meera', 'meera.iyer@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Meera Iyer', 'MI', 'Computer Science & Engineering', 18, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('aditya', 'aditya.varma@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Aditya Varma', 'AV', 'Mechanical Engineering', 19, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('siddharth', 'siddharth.nair@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Siddharth Nair', 'SN', 'Management Studies (MBA)', 20, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('ishaan', 'ishaan.chatterjee@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Ishaan Chatterjee', 'IC', 'Computer Science & Engineering', 21, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('riya', 'riya.sengupta@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Riya Sengupta', 'RS', 'Data Science & Analytics', 22, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('arjun', 'arjun.pillai@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Arjun Pillai', 'AP', 'Electrical & Electronics', 23, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('kavya', 'kavya.sundaram@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Kavya Sundaram', 'KS', 'Civil Engineering', 24, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('devendra', 'devendra.rathore@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Devendra Rathore', 'DR', 'Mechanical Engineering', 25, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('pooja', 'pooja.hegde@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Pooja Hegde', 'PH', 'Information Technology', 26, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('nikhil', 'nikhil.joshi@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Nikhil Joshi', 'NJ', 'Computer Science & Engineering', 27, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('neha', 'neha.bhattacharya@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Neha Bhattacharya', 'NB', 'AI & Robotics', 28, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('chirag', 'chirag.mehta@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Chirag Mehta', 'CM', 'Management Studies (MBA)', 29, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('shalini', 'shalini.menon@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Shalini Menon', 'SM', 'Electronics & Communication', 30, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('abhimanyu', 'abhimanyu.das@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Abhimanyu Das', 'AD', 'Civil Engineering', 31, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('ritika', 'ritika.barua@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Ritika Barua', 'RB', 'Information Technology', 32, true);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('gurpreet', 'gurpreet.singh@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Gurpreet Singh', 'GS', 'Mechanical Engineering', 33, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('pranav', 'pranav.venkatesh@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Pranav Venkatesh', 'PV', 'Computer Science & Engineering', 34, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('swati', 'swati.mahajan@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Swati Mahajan', 'SM', 'Management Studies (MBA)', 35, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('tenzin', 'tenzin.norbu@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Tenzin Norbu', 'TN', 'Electrical & Electronics', 36, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('rajeshwari', 'rajeshwari.s@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Rajeshwari Somayaji', 'RS', 'AI & Data Engineering', 37, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('mayank', 'mayank.tripathi@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Mayank Tripathi', 'MT', 'Civil Engineering', 38, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('deepali', 'deepali.bora@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Deepali Bora', 'DB', 'Computer Science & Engineering', 39, false);

INSERT INTO users (username, email, password, role, name, avatar, department, member_id, enabled)
VALUES ('farhan', 'farhan.qureshi@sice.edu.in', '$2a$12$hxmh0DN7wl9GeD18f7RqY.oUt2I4NAJdu1k45M/GvmGlElPu7Aj5G', 'ROLE_STUDENT', 'Farhan Qureshi', 'FQ', 'Mechanical Engineering', 40, false);
