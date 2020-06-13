CREATE DATABASE `user_authentication` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE user_authentication;
SET SQL_MODE='ALLOW_INVALID_DATES';

create table if not exists `oauth_client_details` (
    `client_id` VARCHAR(255) PRIMARY KEY,
    `resource_ids` VARCHAR(255),
    `client_secret` VARCHAR(255),
    `scope` VARCHAR(255),
    `authorized_grant_types` VARCHAR(255),
    `web_server_redirect_uri` VARCHAR(255),
    `authorities` VARCHAR(255),
    `access_token_validity` INTEGER,
    `refresh_token_validity` INTEGER,
    `autoapprove` VARCHAR(255)
);

create table if not exists `oauth_client_token` (
    `token_id` VARCHAR(255),
    `token` MEDIUMBLOB,
    `authentication_id` VARCHAR(255) PRIMARY KEY,
    `user_name` VARCHAR(255),
    `client_id` VARCHAR(255)
);


create table if not exists `oauth_code` (
    `code` VARCHAR(255),
    `authentication` MEDIUMBLOB
);

create table if not exists `oauth_approvals` (
     `userId` VARCHAR(255),
     `clientId` VARCHAR(255),
     `scope` VARCHAR(255),
     `status` VARCHAR(10),
     `expiresAt` TIMESTAMP,
     `lastModifiedAt` TIMESTAMP
);