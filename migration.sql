ALTER TABLE `cms_block_store`
CHANGE `row_id` `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
DROP PRIMARY KEY,
ADD PRIMARY KEY (`block_id`,`store_id`),
DROP FOREIGN KEY `CMS_BLOCK_STORE_ROW_ID_CMS_BLOCK_ROW_ID`,
ADD CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE;


SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE wfh_downgrade.cms_block DROP FOREIGN KEY CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE;
ALTER TABLE wfh_downgrade.cms_block MODIFY COLUMN row_id smallint NOT NULL COMMENT 'Version Id';
ALTER TABLE wfh_downgrade.cms_block MODIFY COLUMN block_id smallint auto_increment NOT NULL COMMENT 'Entity Id';
ALTER TABLE wfh_downgrade.cms_block DROP PRIMARY KEY;
ALTER TABLE wfh_downgrade.cms_block ADD CONSTRAINT `PRIMARY` PRIMARY KEY (block_id);
