
-- -----------------------------------------------------------------------------
-- Creates the default Statuses
INSERT INTO public.Statuses ("sName")
VALUES ('Active'),('Inactive'),('Expired'),('Obsolete'),('Deprecated');

-- -----------------------------------------------------------------------------
-- Create the default admin user
INSERT INTO public.Users ("uEmail", "uName", "uFullName", "uBio", "uStatus")
VALUES ('admin@hdapp.com', 'admin', 'Zaphod Beeblebrox', 'If theres anything more important than my ego around, I want it caught and shot now.', 1);

-- -----------------------------------------------------------------------------
-- Create the default password for the user 'admin'
INSERT INTO public.Passwords ("pwdUser", "pwdPhrase", "pwdValidUntil", "pwdStatus")
VALUES (1, '4b20c9e612aab77b6de95552a7b054ec843f2dc0bfa956bba4cf1623cd6f577f95b0d6eda7b6a5e504e9c4f7d079750ee326aa8deb5f73646bbebba25b96d1e7', '2999-12-31', 1);

-- -----------------------------------------------------------------------------
-- Create the 'version' entry in the Configs table
INSERT INTO public.Configs ("cfgName", "cfgDesc", "cfgValue", "cfgStatus")
VALUES ('APPVERSION', 'Application version', '0.01 dev', 1),
       ('DBVERSION' , 'Database version'   , '0.01 dev', 1);

-- -----------------------------------------------------------------------------
-- Start the logs...
INSERT INTO public.logs ("logText") VALUES ('Nothing to see here...');