SELECT rolname FROM pg_roles;

CREATE ROLE developer;

SELECT rolname FROM pg_roles WHERE rolname = 'developer';

CREATE USER abdullah WITH PASSWORD 'abdullah12345';

SELECT rolname FROM pg_roles WHERE rolname = 'abdullah';

GRANT CONNECT ON DATABASE xeven TO abdullah;

GRANT USAGE ON SCHEMA public TO abdullah;

GRANT SELECT ON datademo TO abdullah;

GRANT ALL PRIVILEGES ON datademo TO abdullah;

SELECT * FROM information_schema.role_table_grants WHERE table_name = 'datademo';

REVOKE ALL PRIVILEGES ON datademo FROM abdullah;

ALTER USER abdullah WITH PASSWORD 'newpassword123';

REVOKE CONNECT ON DATABASE xeven FROM abdullah;
REVOKE USAGE ON SCHEMA public FROM abdullah;

DROP USER abdullah;

DROP ROLE developer;