% Declaración de predicados dinámicos
:- dynamic docente/2.

salariominimo(2000000).
% Datos de ejemplo
docente(juan_perez, auxiliar).
docente(maria_rodriguez, asociado).
docente(carlos_gomez, titular).

% Deducciones
deduccion_salud(SalarioBase, DeduccionSalud) :-
    DeduccionSalud is SalarioBase * 0.04.

deduccion_pension(SalarioBase, DeduccionPension) :-
    DeduccionPension is SalarioBase * 0.04.

% Bonificaciones
bonificacion(auxiliar, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.05.
bonificacion(asociado, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.1.
bonificacion(titular, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.15.

asignacion_salario(auxiliar, SalarioBase) :-
    salariominimo(SM), SalarioBase is SM * 1.
asignacion_salario(asociado, SalarioBase) :-
    salariominimo(SM), SalarioBase is SM * 2.5.
asignacion_salario(titular, SalarioBase) :-
    salariominimo(SM), SalarioBase is SM * 4.
% Cálculo del salario neto
salario_neto(NombreDocente, SalarioNeto) :-
    docente(NombreDocente, Categoria),
    asignacion_salario(Categoria,SalarioBase),
    deduccion_salud(SalarioBase, DeduccionSalud),
    deduccion_pension(SalarioBase, DeduccionPension),
    bonificacion(Categoria, SalarioBase, Bonificacion),
    SalarioNeto is SalarioBase - DeduccionSalud - DeduccionPension + Bonificacion.