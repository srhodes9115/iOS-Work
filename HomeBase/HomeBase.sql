DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "firstName" TEXT NOT NULL , "lastName" TEXT NOT NULL , "email" TEXT NOT NULL  UNIQUE , "password" TEXT NOT NULL , "teamName" TEXT NOT NULL , "username" TEXT NOT NULL );
