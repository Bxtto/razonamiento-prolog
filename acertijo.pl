% Biblioteca de estudiantes
solucion(Estudiantes) :-
    length(Estudiantes, 4),
    % Cada elemento de la lista es estudiante(Posicion, Nombre, Color, Genero, Paginas)
    
    % Encontrar las posiciones de todas las estudiantes
    member(estudiante(1, N1, C1, G1, P1), Estudiantes),
    member(estudiante(2, N2, C2, G2, P2), Estudiantes),
    member(estudiante(3, N3, C3, G3, P3), Estudiantes),
    member(estudiante(4, N4, C4, G4, P4), Estudiantes),
    
    % Asignar nombres únicos
    permutation([beatriz, margarita, rebeca, karina], [N1, N2, N3, N4]),
    
    % Asignar colores únicos
    permutation([negro, naranja, purpura, amarillo], [C1, C2, C3, C4]),
    
    % Asignar géneros únicos
    permutation([biografia, filosofia, poesia, ciencia_ficcion], [G1, G2, G3, G4]),
    
    % Asignar páginas únicas
    permutation([50, 100, 200, 300], [P1, P2, P3, P4]),
    
    % 1. El libro de 300 páginas está en el tercer lugar
    member(estudiante(3, _, _, _, 300), Estudiantes),
    
    % 2. Filosofía está en la última posición
    member(estudiante(4, _, _, filosofia, _), Estudiantes),
    
    % 3. Ciencia ficción está en un extremo (1 o 4)
    (member(estudiante(1, _, _, ciencia_ficcion, _), Estudiantes);
     member(estudiante(4, _, _, ciencia_ficcion, _), Estudiantes)),
    
    % 4. Poesía está junto a Margarita
    (junto(estudiante(Pos1, _, _, poesia, _), estudiante(Pos2, margarita, _, _, _), Estudiantes)),
    
    % 5. Púrpura está después de quien tiene 50 páginas
    despues(estudiante(_, _, purpura, _, _), estudiante(_, _, _, _, 50), Estudiantes),
    
    % 6. Púrpura está antes que negro
    antes(estudiante(_, _, purpura, _, _), estudiante(_, _, negro, _, _), Estudiantes),
    
    % 7. Rebeca tiene 300 páginas
    member(estudiante(_, rebeca, _, _, 300), Estudiantes),
    
    % 8. Beatriz tiene 100 páginas
    member(estudiante(_, beatriz, _, _, 100), Estudiantes),
    
    % 9. 100 páginas está junto a naranja
    junto(estudiante(_, _, _, _, 100), estudiante(_, _, naranja, _, _), Estudiantes),
    
    % 10. Karina está junto a púrpura
    junto(estudiante(_, karina, _, _, _), estudiante(_, _, purpura, _, _), Estudiantes),
    
    % 11. 100 páginas está en un extremo
    (member(estudiante(1, _, _, _, 100), Estudiantes);
     member(estudiante(4, _, _, _, 100), Estudiantes)),
     
    % 12. 200 páginas está en un extremo
    (member(estudiante(1, _, _, _, 200), Estudiantes);
     member(estudiante(4, _, _, _, 200), Estudiantes)).

% Predicado para verificar si dos estudiantes están juntas
junto(E1, E2, Estudiantes) :-
    member(E1, Estudiantes),
    member(E2, Estudiantes),
    E1 = estudiante(Pos1, _, _, _, _),
    E2 = estudiante(Pos2, _, _, _, _),
    (Pos2 =:= Pos1 + 1; Pos2 =:= Pos1 - 1).

% Predicado para verificar si un estudiante está antes que otro
antes(E1, E2, Estudiantes) :-
    member(E1, Estudiantes),
    member(E2, Estudiantes),
    E1 = estudiante(Pos1, _, _, _, _),
    E2 = estudiante(Pos2, _, _, _, _),
    Pos1 < Pos2.

% Predicado para verificar si un estudiante está después que otro
despues(E1, E2, Estudiantes) :-
    antes(E2, E1, Estudiantes).

% Consulta para obtener la solución
:- solucion(Estudiantes), 
   write('Solución encontrada:'), nl,
   member(estudiante(_, _, _, _, _), Estudiantes),
   write(Estudiantes), nl.