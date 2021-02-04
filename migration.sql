-- CMS

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


ALTER TABLE `cms_page_store`
CHANGE `row_id` `page_id`  smallint(6) NOT NULL COMMENT 'Page ID',
DROP PRIMARY KEY,
ADD PRIMARY KEY (`page_id`,`store_id`),
DROP FOREIGN KEY `CMS_PAGE_STORE_ROW_ID_CMS_PAGE_ROW_ID`,
ADD CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE;

ALTER TABLE wfh_downgrade.cms_page DROP FOREIGN KEY CMS_PAGE_PAGE_ID_SEQUENCE_CMS_PAGE_SEQUENCE_VALUE;
ALTER TABLE wfh_downgrade.cms_page MODIFY COLUMN row_id smallint NOT NULL COMMENT 'Version Id';
ALTER TABLE wfh_downgrade.cms_page MODIFY COLUMN page_id smallint auto_increment NOT NULL COMMENT 'Entity Id';
ALTER TABLE wfh_downgrade.cms_page DROP PRIMARY KEY;
ALTER TABLE wfh_downgrade.cms_page ADD CONSTRAINT `PRIMARY` PRIMARY KEY (page_id);

-- PRODUCT

ALTER TABLE `catalog_product_entity_datetime`
    CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
    DROP FOREIGN KEY `CAT_PRD_ENTT_DTIME_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
    ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;


ALTER TABLE wfh_downgrade.catalog_product_entity DROP FOREIGN KEY CATALOG_PRODUCT_ENTITY_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE;
ALTER TABLE wfh_downgrade.catalog_product_entity MODIFY COLUMN row_id int unsigned NOT NULL COMMENT 'Version Id';
ALTER TABLE wfh_downgrade.catalog_product_entity MODIFY COLUMN entity_id int unsigned auto_increment NOT NULL COMMENT 'Entity Id';
ALTER TABLE wfh_downgrade.catalog_product_entity DROP PRIMARY KEY;
ALTER TABLE wfh_downgrade.catalog_product_entity ADD CONSTRAINT `PRIMARY` PRIMARY KEY (entity_id);


SHOW CREATE TABLE wfh_downgrade.catalog_product_entity;
