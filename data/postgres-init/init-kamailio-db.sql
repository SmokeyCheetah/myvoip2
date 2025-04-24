-- Create Kamailio database tables
-- You should replace this with the actual Kamailio schema
CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL DEFAULT '',
    domain VARCHAR(64) DEFAULT NULL,
    contact VARCHAR(255) NOT NULL DEFAULT '',
    received VARCHAR(128) DEFAULT NULL,
    path VARCHAR(512) DEFAULT NULL,
    expires TIMESTAMP NOT NULL DEFAULT '2030-05-28 21:32:15',
    q REAL NOT NULL DEFAULT 1.0,
    callid VARCHAR(255) NOT NULL DEFAULT 'Default-Call-ID',
    cseq INTEGER NOT NULL DEFAULT 1,
    last_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    flags INTEGER NOT NULL DEFAULT 0,
    cflags INTEGER NOT NULL DEFAULT 0,
    user_agent VARCHAR(255) NOT NULL DEFAULT '',
    socket VARCHAR(64) DEFAULT NULL,
    methods INTEGER DEFAULT NULL,
    ruid VARCHAR(64) DEFAULT NULL,
    reg_id INTEGER NOT NULL DEFAULT 0,
    instance VARCHAR(255) DEFAULT NULL,
    CONSTRAINT location_ruid_idx UNIQUE (ruid)
);

CREATE INDEX location_account_contact_idx ON location (username, domain, contact);
