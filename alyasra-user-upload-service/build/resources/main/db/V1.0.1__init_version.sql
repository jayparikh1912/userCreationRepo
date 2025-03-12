CREATE TABLE tbl_scheduler_config (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      name VARCHAR(255),
                                      cron_expression VARCHAR(255),
                                      is_deleted BOOLEAN DEFAULT FALSE,
                                      status VARCHAR(255),
                                      scheduled_time TIMESTAMP
);

INSERT INTO tbl_scheduler_config (name, cron_expression, is_deleted, status, scheduled_time)
VALUES ('INACTIVE_PROMOTION_JOB', '0 0 * * * *', false, 'ACTIVE', NOW());

CREATE TABLE tbl_divisions
(
    id                 VARCHAR(255) PRIMARY KEY,
    name_en            VARCHAR(255),
    name_ar            VARCHAR(255),
    parent_division_id VARCHAR(255),
    is_deleted         BOOLEAN  DEFAULT FALSE,
    createdate         DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_items
(
    id                 VARCHAR(255) PRIMARY KEY,
    name_en            VARCHAR(255),
    name_ar            VARCHAR(255),
    item_code          VARCHAR(255),
    item_category      VARCHAR(255),
    status             VARCHAR(255),
    item_group         VARCHAR(255),
    item_class         VARCHAR(255),
    image_url          VARCHAR(255),
    is_deleted         BOOLEAN  DEFAULT FALSE,
    createdate         DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_item_cost_rel
(
    id         VARCHAR(36) PRIMARY KEY,
    uom        VARCHAR(255),
    cost       DOUBLE,
    currency   VARCHAR(255),
    item_id    VARCHAR(36),
    is_deleted BOOLEAN DEFAULT FALSE
);

ALTER TABLE tbl_item_cost_rel
    ADD CONSTRAINT fk_item_cost_rel_item FOREIGN KEY (item_id) REFERENCES tbl_items (id);

CREATE TABLE tbl_item_uom_mapping
(
    id            VARCHAR(36) PRIMARY KEY,
    from_uom      VARCHAR(255),
    uom_factor    DOUBLE,
    price_factor  DOUBLE,
    to_uom        VARCHAR(255),
    base_uom_flag BOOLEAN DEFAULT FALSE,
    item_id       VARCHAR(36),
    is_deleted    BOOLEAN DEFAULT FALSE
);

ALTER TABLE tbl_item_uom_mapping
    ADD CONSTRAINT fk_item_uom_mapping_item FOREIGN KEY (item_id) REFERENCES tbl_items (id);

ALTER TABLE tbl_items add column brand varchar(255);

ALTER TABLE tbl_items add column country varchar(255);

CREATE TABLE tbl_catalogs
(
    id                   VARCHAR(36) PRIMARY KEY,
    name                 VARCHAR(255),
    status               VARCHAR(255),
    type                 VARCHAR(255),
    description          VARCHAR(255),
    division_id          VARCHAR(255),
    org_id               VARCHAR(255),
    parent_division_id   VARCHAR(255),
    currency             VARCHAR(255),
    secondary_catalog_id VARCHAR(36),
    tenant_id            BIGINT           DEFAULT 1,
    is_deleted           BOOLEAN NOT NULL DEFAULT FALSE,
    createdate           DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate     DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname         VARCHAR(255),
    lastmodifiedbyname   VARCHAR(255),
    createdbyid          BIGINT,
    lastmodifiedbyid     BIGINT
);

CREATE TABLE tbl_catalog_dtls
(
    id                 VARCHAR(36) PRIMARY KEY,
    status             VARCHAR(255),
    item_id            VARCHAR(255),
    action             VARCHAR(255),
    identifier         VARCHAR(255),
    start_date         DATE,
    end_date           DATE,
    std_price          DOUBLE,
    min_price          DOUBLE,
    max_price          DOUBLE,
    max_qty            BIGINT,
    uom                VARCHAR(255),
    cost               DOUBLE,
    max_qty_type       VARCHAR(255),
    std_price_type     VARCHAR(255),
    max_price_type     VARCHAR(255),
    min_price_type     VARCHAR(255),
    std_price_value    DOUBLE,
    max_price_value    DOUBLE,
    min_price_value    DOUBLE,
    catalog_id         VARCHAR(36),
    tenant_id          BIGINT           DEFAULT 1,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

ALTER TABLE tbl_catalog_dtls
    ADD CONSTRAINT fk_catalog_dtls_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

CREATE TABLE tbl_catalog_customer_rel
(
    id          VARCHAR(36) PRIMARY KEY,
    catalog_id  VARCHAR(36),
    customer_id VARCHAR(255),
    name_en     VARCHAR(255),
    name_ar     VARCHAR(255),
    tenant_id   BIGINT           DEFAULT 1,
    is_deleted  BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tbl_catalog_customer_rel
    ADD CONSTRAINT fk_catalog_customer_rel_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

CREATE TABLE tbl_catalog_history
(
    id                 VARCHAR(36) PRIMARY KEY,
    status             VARCHAR(255),
    item_id            VARCHAR(255),
    action             VARCHAR(255),
    identifier         VARCHAR(255),
    start_date         DATE,
    end_date           DATE,
    std_price          DOUBLE,
    min_price          DOUBLE,
    max_price          DOUBLE,
    max_qty            BIGINT,
    uom                VARCHAR(255),
    cost               DOUBLE,
    max_qty_type       VARCHAR(255),
    std_price_type     VARCHAR(255),
    max_price_type     VARCHAR(255),
    min_price_type     VARCHAR(255),
    std_price_value    DOUBLE,
    max_price_value    DOUBLE,
    min_price_value    DOUBLE,
    catalog_id         VARCHAR(36),
    tenant_id          BIGINT           DEFAULT 1,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

ALTER TABLE tbl_catalog_history
    ADD CONSTRAINT fk_catalog_history_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

ALTER TABLE tbl_catalog_dtls
    ADD is_from_current TINYINT(1) DEFAULT 1;

CREATE TABLE tbl_catalog_exception
(
    id                 VARCHAR(255) PRIMARY KEY,
    exception_for      VARCHAR(255),
    division_id        VARCHAR(255),
    parent_division_id VARCHAR(255),
    currency           VARCHAR(100),
    start_date         DATE,
    end_date           DATE,
    tenant_id            BIGINT           DEFAULT 1,
    is_deleted           BOOLEAN NOT NULL DEFAULT FALSE,
    createdate         TIMESTAMP    NOT NULL,
    lastmodifieddate   TIMESTAMP    NOT NULL,
    createbyname       VARCHAR(255) NOT NULL,
    lastmodifiedbyname VARCHAR(255) NOT NULL,
    createdbyid        BIGINT       NOT NULL,
    lastmodifiedbyid   BIGINT       NOT NULL
);

CREATE TABLE tbl_catalog_exception_item (
                                            id VARCHAR(255) PRIMARY KEY,
                                            item_id VARCHAR(255),
                                            uom VARCHAR(255),
                                            cost DOUBLE,
                                            allow_std_price VARCHAR(3),
                                            allow_multiple_shelf_life VARCHAR(255),
                                            catalog_exception_id VARCHAR(255),
                                            FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception(id)
);

CREATE TABLE tbl_catalog_exception_override_details
(
    id                      VARCHAR(255) PRIMARY KEY,
    line_type               VARCHAR(255),
    is_primary              BOOLEAN NOT NULL DEFAULT FALSE,
    shelf_life              VARCHAR(255),
    std_price_type          VARCHAR(255),
    std_price_value DOUBLE,
    final_std_price DOUBLE,
    max_price_type          VARCHAR(255),
    max_price_value DOUBLE,
    final_max_price DOUBLE,
    limit_max_quantity_type VARCHAR(255),
    limit_max_quantity_value DOUBLE,
    stock_on_hand DOUBLE,
    consumed_stock DOUBLE,
    catalog_exception_id    VARCHAR(255),
    FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception (id)
);

CREATE TABLE tbl_catalog_exception_customer_rel
(
    id                   VARCHAR(255) PRIMARY KEY,
    catalog_exception_id VARCHAR(255),
    customer_id          VARCHAR(255),
    name_en              VARCHAR(255),
    name_ar              VARCHAR(255),
    tenant_id            BIGINT           DEFAULT 1,
    is_deleted           BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception (id)
);

ALTER TABLE tbl_catalog_exception_override_details ADD uom VARCHAR(255), ADD cost DOUBLE;

CREATE TABLE tbl_promotions
(
    id                   VARCHAR(255) PRIMARY KEY,
    name                 VARCHAR(255),
    promo_code           VARCHAR(255),
    status               VARCHAR(255),
    start_date           DATE,
    end_date             DATE,
    description          VARCHAR(255),
    qualifier_type       VARCHAR(255),
    division_id          VARCHAR(255),
    division             VARCHAR(255),
    promotion_type       VARCHAR(255),
    promotion_sub_type   VARCHAR(255),
    matching_order_value VARCHAR(255),
    promotion_value      DOUBLE,
    activation_status    VARCHAR(255),
    promotion_percentage_value DOUBLE,
    currency             VARCHAR(255),
    tenant_id            BIGINT  DEFAULT 1,
    is_deleted           BOOLEAN DEFAULT FALSE,
    createdate           TIMESTAMP    NOT NULL,
    lastmodifieddate     TIMESTAMP    NOT NULL,
    createbyname         VARCHAR(255) NOT NULL,
    lastmodifiedbyname   VARCHAR(255) NOT NULL,
    createdbyid          BIGINT       NOT NULL,
    lastmodifiedbyid     BIGINT       NOT NULL
);

CREATE TABLE tbl_promotion_item_details
(
    id           VARCHAR(255) PRIMARY KEY,
    item_id      VARCHAR(255),
    description  VARCHAR(255),
    uom          VARCHAR(255),
    qty          DOUBLE,
    max_qty      DOUBLE,
    price        DOUBLE,
    is_base_item BOOLEAN DEFAULT FALSE,
    promotion_id VARCHAR(255),
    is_deleted   BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (promotion_id) REFERENCES tbl_promotions (id)
);

CREATE TABLE tbl_promotion_customer_rel
(
    id           VARCHAR(255) PRIMARY KEY,
    customer_id  VARCHAR(255),
    name_en      VARCHAR(255),
    name_ar      VARCHAR(255),
    is_deleted   BOOLEAN DEFAULT FALSE,
    promotion_id VARCHAR(255),
    FOREIGN KEY (promotion_id) REFERENCES tbl_promotions (id)
);

CREATE TABLE tbl_quote_contract
(
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    end_date           date,
    id                 VARCHAR(255) PRIMARY KEY,
    start_date         date,
    tenant_id          bigint,
    validity_date      date,
    customer_id        varchar(255),
    description        varchar(255),
    name_ar            varchar(255),
    name_en            varchar(255),
    number             varchar(255),
    status             varchar(255),
    type               varchar(255),
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_quote_contract_dtls
(
    commited_qty       double,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    consumed_qty       double,
    expected_price     double,
    id                 VARCHAR(255) PRIMARY KEY,
    quote_id           VARCHAR(255),
    tenant_id          bigint,
    item_id            varchar(255),
    status             varchar(255),
    uom                varchar(255),
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

ALTER TABLE tbl_quote_contract_dtls
    ADD CONSTRAINT fk_quote_dtls_quote FOREIGN KEY (quote_id) REFERENCES tbl_quote_contract (id) ON DELETE CASCADE;

CREATE TABLE tbl_quote_contract_doc_dtls
(
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    id                  VARCHAR(255) PRIMARY KEY,
    quote_id            VARCHAR(255),
    tenant_id           bigint       DEFAULT NULL,
    file_name           varchar(255) DEFAULT NULL,
    file_path           varchar(255) DEFAULT NULL,
    unique_file_name    varchar(255) DEFAULT NULL,
    document_type       varchar(255) DEFAULT NULL,
    external_identifier varchar(255) DEFAULT NULL,
    from_date           date         DEFAULT NULL,
    to_date             date         DEFAULT NULL,
    unique_name         varchar(255) DEFAULT NULL,
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT,
    PRIMARY KEY (id)
);

ALTER TABLE tbl_quote_contract_doc_dtls
    ADD CONSTRAINT fk_quote_doc_quote FOREIGN KEY (quote_id) REFERENCES tbl_quote_contract (id) ON DELETE CASCADE;

CREATE TABLE tbl_syssetting
(
    is_deleted       BOOLEAN NOT NULL DEFAULT FALSE,
    is_tenant_config bit(1),
    iid              BIGINT AUTO_INCREMENT PRIMARY KEY,
    tenant_id        bigint,
    category         varchar(255),
    category_group   varchar(255),
    display_key      varchar(255),
    flag_name        varchar(255),
    value            longtext
);

CREATE TABLE `tblcommonlist` (
 `list_item_id` bigint NOT NULL AUTO_INCREMENT,
 `status` varchar(255),
 `tenant_id` bigint DEFAULT 1,
 `list_text` varchar(255),
 `list_type` varchar(40),
 `list_value` varchar(255),
 `is_deleted` boolean default false,
 PRIMARY KEY (`list_item_id`)
);

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(1, 'Active', 'Fix Value', 'priceType', 'Fix Value');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(2, 'Active', 'Fix Value On Cost', 'priceType', 'Fix Value On Cost');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(3, 'Active', '% On Cost', 'priceType', '% On Cost');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(4, 'Active', 'Fix Value', 'qtyType', 'Fix Value');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(5, 'Active', '% Of Stock', 'qtyType', '% Of Stock');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(6, 'Active', 'Active', 'status', 'Active');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(7, 'Active', 'Inactive', 'status', 'Inactive');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(8, 'Active', 'Customer', 'forWhom', 'Customer');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(9, 'Active', 'Work Unit', 'forWhom', 'Work Unit');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(10, 'Active', 'KD', 'currency', 'KD');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(11, 'Active', 'Yes', 'flag', 'Yes');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(12, 'Active', 'No', 'flag', 'No');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(13, 'Active', 'Liquidation', 'lineType', 'Liquidation');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(14, 'Active', 'Different Shelf Life', 'lineType', 'Different Shelf Life');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(15, 'Active', 'Header', 'promotionType', 'Header');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(16, 'Active', 'Line', 'promotionType', 'Line');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(17, 'Active', 'Fixed Percentage', 'Header', 'Fixed Percentage');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(18, 'Active', 'Buy X Get Y', 'Line', 'Buy X Get Y');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(19, 'Active', 'Discounted Price', 'Line', 'Discounted Price');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(20, 'Active', 'Volume Based Discount', 'Line', 'Volume Based Discount');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(21, 'Active', 'Draft', 'approvalStatus', 'Draft');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(22, 'Active', 'Pending Approval', 'approvalStatus', 'Pending Approval');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(23, 'Active', 'Approved', 'approvalStatus', 'Approved');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(24, 'Active', 'Rejected', 'approvalStatus', 'Rejected');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(25, 'Active', 'Action Required', 'approvalStatus', 'Action Required');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(26, 'Active', 'Legal Document', 'docType', 'Legal Document');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(27, 'Active', 'Signatory Letter', 'docType', 'Signatory Letter');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(28, 'Active', 'Bank Details', 'docType', 'Bank Details');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(29, 'Active', 'Terms and Conditions', 'docType', 'Terms and Conditions');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(30, 'Active', 'Quote', 'customPricingType', 'Quote');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES(31, 'Active', 'Contract', 'customPricingType', 'Contract');
