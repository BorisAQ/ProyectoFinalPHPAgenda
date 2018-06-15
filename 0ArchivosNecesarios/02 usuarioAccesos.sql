CREATE USER 'user_a'@'localhost' IDENTIFIED BY '12345';
GRANT INSERT ON bd_agenda.age_usuario TO 'user_a'@'localhost';


CREATE USER 'user_l'@'localhost' IDENTIFIED BY '123456';
GRANT SELECT (usu_correo, usu_password) ON bd_agenda.age_usuario TO 'user_l'@'localhost';


CREATE USER 'evento_i'@'localhost' IDENTIFIED BY '54321';
GRANT SELECT(usu_codigo, usu_correo) ON bd_agenda.age_usuario TO 'evento_i'@'localhost';
GRANT INSERT ON bd_agenda.age_evento TO 'evento_i'@'localhost';


CREATE USER 'evento_s'@'localhost' IDENTIFIED BY '12345';
GRANT SELECT ON bd_agenda.age_evento TO 'evento_s'@'localhost';
GRANT SELECT(usu_codigo, usu_correo) ON bd_agenda.age_usuario TO 'evento_s'@'localhost';

CREATE USER 'evento_d'@'localhost' IDENTIFIED BY '12345';
GRANT DELETE ON bd_agenda.age_evento TO 'evento_d'@'localhost';
GRANT SELECT(eve_codigo) ON bd_agenda.age_evento TO 'evento_d'@'localhost';


CREATE USER 'evento_u'@'localhost' IDENTIFIED BY '12345';
GRANT UPDATE ON bd_agenda.age_evento TO 'evento_u'@'localhost';
GRANT SELECT(eve_codigo) ON bd_agenda.age_evento TO 'evento_u'@'localhost';




