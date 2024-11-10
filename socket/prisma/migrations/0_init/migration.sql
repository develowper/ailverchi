-- CreateTable
CREATE TABLE `admin_financials` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_id` BIGINT UNSIGNED NULL,
    `wallet` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `card` VARCHAR(20) NULL,
    `sheba` VARCHAR(30) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `admin_financials_admin_id_foreign`(`admin_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `admins` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `agency_id` BIGINT UNSIGNED NULL,
    `agency_level` ENUM('0', '1', '2') NULL,
    `fullname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NULL,
    `email_verified_at` TIMESTAMP(0) NULL,
    `phone` VARCHAR(20) NULL,
    `phone_verified` BOOLEAN NOT NULL DEFAULT false,
    `password` VARCHAR(200) NULL,
    `access` LONGTEXT NULL,
    `role` ENUM('god', 'owner', 'admin', 'operator') NOT NULL DEFAULT 'god',
    `status` ENUM('active', 'inactive', 'block') NOT NULL DEFAULT 'active',
    `notifications` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `wallet` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `national_code` VARCHAR(20) NULL,
    `push_id` VARCHAR(20) NULL,
    `expires_at` TIMESTAMP(0) NULL,
    `settings` LONGTEXT NULL,
    `telegram_id` VARCHAR(50) NULL,
    `bale_id` VARCHAR(50) NULL,
    `ref_id` VARCHAR(10) NULL,
    `step` TINYINT NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `admins_email_unique`(`email`),
    INDEX `admins_agency_id_foreign`(`agency_id`),
    INDEX `admins_bale_id_index`(`bale_id`),
    INDEX `admins_phone_index`(`phone`),
    INDEX `admins_telegram_id_index`(`telegram_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agencies` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `phone` VARCHAR(20) NULL,
    `postal_code` VARCHAR(20) NULL,
    `access` LONGTEXT NULL,
    `level` ENUM('0', '1', '2') NOT NULL DEFAULT 2,
    `parent_id` BIGINT UNSIGNED NULL,
    `province_id` SMALLINT UNSIGNED NULL,
    `county_id` SMALLINT UNSIGNED NULL,
    `district_id` SMALLINT UNSIGNED NULL,
    `address` VARCHAR(2048) NULL,
    `location` VARCHAR(50) NULL,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'inactive',
    `wallet` BIGINT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `order_profit_percent` DECIMAL(4, 2) NULL,

    INDEX `agencies_county_id_foreign`(`county_id`),
    INDEX `agencies_district_id_foreign`(`district_id`),
    INDEX `agencies_parent_id_foreign`(`parent_id`),
    INDEX `agencies_province_id_index`(`province_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agency_financials` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `agency_id` BIGINT UNSIGNED NULL,
    `wallet` BIGINT NOT NULL DEFAULT 0,
    `parent_debit` BIGINT NOT NULL DEFAULT 0,
    `card` VARCHAR(20) NULL,
    `sheba` VARCHAR(30) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `agency_financials_agency_id_foreign`(`agency_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `articles` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `owner_id` BIGINT UNSIGNED NULL,
    `author` VARCHAR(200) NULL,
    `title` VARCHAR(1024) NOT NULL,
    `slug` VARCHAR(2048) NULL,
    `view` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `duration` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `tags` VARCHAR(200) NULL,
    `content` LONGTEXT NULL,
    `status` ENUM('inactive', 'active', 'block') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `articles_owner_id_foreign`(`owner_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cache` (
    `key` VARCHAR(255) NOT NULL,
    `value` MEDIUMTEXT NOT NULL,
    `expiration` INTEGER NOT NULL,

    PRIMARY KEY (`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cache_locks` (
    `key` VARCHAR(255) NOT NULL,
    `owner` VARCHAR(255) NOT NULL,
    `expiration` INTEGER NOT NULL,

    PRIMARY KEY (`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cars` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `plate_number` VARCHAR(30) NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `driver_id` BIGINT UNSIGNED NULL,

    INDEX `cars_agency_id_foreign`(`agency_id`),
    INDEX `cars_driver_id_foreign`(`driver_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cart_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `cart_id` BIGINT UNSIGNED NULL,
    `variation_id` BIGINT UNSIGNED NULL,
    `repo_id` BIGINT UNSIGNED NULL,
    `qty` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `unit` ENUM('piece', 'kg') NOT NULL DEFAULT 'piece',
    `visit_checked` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `delivery_date` DATE NULL,
    `delivery_timestamp` VARCHAR(15) NULL,

    INDEX `cart_items_cart_id_foreign`(`cart_id`),
    INDEX `cart_items_repo_id_foreign`(`repo_id`),
    INDEX `cart_items_shipping_id_foreign`(`shipping_id`),
    INDEX `cart_items_variation_id_foreign`(`variation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `carts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NULL,
    `ip` VARCHAR(45) NULL,
    `address_idx` TINYINT UNSIGNED NULL,
    `last_activity` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `order_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `carts_last_activity_index`(`last_activity`),
    INDEX `carts_order_id_foreign`(`order_id`),
    INDEX `carts_user_id_index`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `level` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `name` VARCHAR(100) NOT NULL,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'active',
    `parent_id` INTEGER UNSIGNED NULL,
    `children` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `categories_parent_id_foreign`(`parent_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cities` (
    `id` SMALLINT UNSIGNED NOT NULL,
    `parent_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    `name` VARCHAR(50) NOT NULL,
    `latitude` VARCHAR(30) NULL,
    `longitude` VARCHAR(30) NULL,
    `slug` VARCHAR(100) NOT NULL,
    `level` ENUM('1', '2', '3') NOT NULL DEFAULT 1,
    `tags` LONGTEXT NOT NULL DEFAULT '[]',
    `bbox` LONGTEXT NOT NULL DEFAULT '[]',
    `has_child` BOOLEAN NOT NULL DEFAULT false,
    `radius` SMALLINT UNSIGNED NOT NULL DEFAULT 0,

    INDEX `cities_name_index`(`name`),
    INDEX `cities_parent_id_foreign`(`parent_id`),
    INDEX `cities_slug_index`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coupons` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(10) NOT NULL,
    `discount_percent` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `used_times` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `used_at` TIMESTAMP(0) NULL,
    `expires_at` TIMESTAMP(0) NULL,
    `min_price` INTEGER UNSIGNED NULL,
    `limit_discount` INTEGER UNSIGNED NULL,
    `limit_use` INTEGER UNSIGNED NULL,
    `user_id` BIGINT UNSIGNED NULL,

    INDEX `coupons_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `drivers` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(200) NULL,
    `national_code` VARCHAR(20) NULL,
    `phone` VARCHAR(20) NULL,
    `wallet` BIGINT NOT NULL DEFAULT 0,
    `card` VARCHAR(20) NULL,
    `sheba` VARCHAR(30) NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `drivers_agency_id_foreign`(`agency_id`),
    INDEX `drivers_phone_index`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `failed_jobs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(191) NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_batches` (
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `total_jobs` INTEGER NOT NULL,
    `pending_jobs` INTEGER NOT NULL,
    `failed_jobs` INTEGER NOT NULL,
    `failed_job_ids` LONGTEXT NOT NULL,
    `options` MEDIUMTEXT NULL,
    `cancelled_at` INTEGER NULL,
    `created_at` INTEGER NOT NULL,
    `finished_at` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jobs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `queue` VARCHAR(255) NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `attempts` TINYINT UNSIGNED NOT NULL,
    `reserved_at` INTEGER UNSIGNED NULL,
    `available_at` INTEGER UNSIGNED NOT NULL,
    `created_at` INTEGER UNSIGNED NOT NULL,

    INDEX `jobs_queue_index`(`queue`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `logs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `model` VARCHAR(50) NULL,
    `from` LONGTEXT NULL,
    `to` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `messages` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(100) NULL,
    `phone` VARCHAR(20) NULL,
    `type` VARCHAR(10) NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `messages_type_index`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(191) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `subject` VARCHAR(100) NOT NULL,
    `data_id` BIGINT UNSIGNED NULL,
    `type` ENUM('pay', 'access_change', 'ticket_answer') NULL,
    `description` TEXT NULL,
    `link` VARCHAR(512) NULL,
    `owner_id` BIGINT UNSIGNED NULL,
    `owner_type` ENUM('admin', 'operator', 'user', 'agency') NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NULL,
    `title` VARCHAR(1024) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `shipping_method_id` BIGINT UNSIGNED NULL,
    `order_id` BIGINT UNSIGNED NULL,
    `variation_id` BIGINT UNSIGNED NULL,
    `repo_id` BIGINT UNSIGNED NULL,
    `qty` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `unit` ENUM('piece', 'kg') NOT NULL DEFAULT 'piece',
    `total_price` BIGINT UNSIGNED NOT NULL,
    `discount_price` BIGINT UNSIGNED NOT NULL,
    `pack_id` INTEGER UNSIGNED NULL,
    `total_weight` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `grade` ENUM('1', '2', '3') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `order_items_order_id_foreign`(`order_id`),
    INDEX `order_items_pack_id_foreign`(`pack_id`),
    INDEX `order_items_repo_id_foreign`(`repo_id`),
    INDEX `order_items_shipping_id_foreign`(`shipping_id`),
    INDEX `order_items_shipping_method_id_foreign`(`shipping_method_id`),
    INDEX `order_items_variation_id_foreign`(`variation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_payments` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `repo_id` BIGINT UNSIGNED NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `transaction_id` BIGINT UNSIGNED NULL,
    `user_id` BIGINT UNSIGNED NULL,
    `status` ENUM('request', 'pending', 'processing', 'ready', 'sending', 'delivered', 'canceled', 'rejected', 'refunded') NOT NULL,
    `province_id` SMALLINT UNSIGNED NULL,
    `county_id` SMALLINT UNSIGNED NULL,
    `district_id` SMALLINT UNSIGNED NULL,
    `receiver_fullname` VARCHAR(200) NULL,
    `receiver_phone` VARCHAR(20) NULL,
    `postal_code` VARCHAR(20) NULL,
    `address` VARCHAR(2048) NULL,
    `location` VARCHAR(50) NULL,
    `coupon` VARCHAR(10) NULL,
    `total_discount` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_items` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `total_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_items_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_shipping_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `change_price` BIGINT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `done_at` TIMESTAMP(0) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `shipping_method_id` BIGINT UNSIGNED NULL,
    `delivery_date` DATE NULL,
    `delivery_timestamp` VARCHAR(15) NULL,
    `pay_type` ENUM('online', 'local') NULL,
    `payed_at` TIMESTAMP(0) NULL,
    `distance` INTEGER UNSIGNED NULL,
    `tax_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `total_weight` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,

    INDEX `orders_agency_id_foreign`(`agency_id`),
    INDEX `orders_county_id_foreign`(`county_id`),
    INDEX `orders_district_id_foreign`(`district_id`),
    INDEX `orders_province_id_foreign`(`province_id`),
    INDEX `orders_repo_id_foreign`(`repo_id`),
    INDEX `orders_shipping_id_foreign`(`shipping_id`),
    INDEX `orders_shipping_method_id_foreign`(`shipping_method_id`),
    INDEX `orders_status_index`(`status`),
    INDEX `orders_transaction_id_foreign`(`transaction_id`),
    INDEX `orders_user_id_index`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `weight` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `height` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `width` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `length` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'inactive',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerships` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(100) NOT NULL,
    `meterage` VARCHAR(10) NULL,
    `province_id` SMALLINT UNSIGNED NULL,
    `county_id` SMALLINT UNSIGNED NULL,
    `address` VARCHAR(2048) NULL,
    `description` VARCHAR(2048) NULL,
    `products` LONGTEXT NULL,
    `phone` VARCHAR(20) NULL,
    `type` ENUM('agency', 'farmer', 'gardener') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `partnerships_county_id_foreign`(`county_id`),
    INDEX `partnerships_province_id_index`(`province_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_resets` (
    `email` VARCHAR(100) NOT NULL,
    `token` VARCHAR(2048) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payments` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NULL,
    `app_version` SMALLINT UNSIGNED NULL,
    `order_id` VARCHAR(50) NULL,
    `pay_for` VARCHAR(50) NULL,
    `pay_market` ENUM('bazaar', 'myket', 'playstore', 'bank') NULL,
    `info` VARCHAR(2048) NULL,
    `amount` INTEGER NOT NULL DEFAULT 0,
    `is_success` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `payments_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `personal_access_tokens` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tokenable_type` VARCHAR(191) NOT NULL,
    `tokenable_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `token` VARCHAR(64) NOT NULL,
    `abilities` TEXT NULL,
    `last_used_at` TIMESTAMP(0) NULL,
    `expires_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `personal_access_tokens_token_unique`(`token`),
    INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `category` LONGTEXT NULL,
    `weight` DECIMAL(8, 3) NOT NULL,
    `category_id` INTEGER UNSIGNED NULL,
    `tags` VARCHAR(1024) NULL,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'inactive',
    `sell_count` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `charged_at` TIMESTAMP(0) NULL,
    `rate` INTEGER UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `description` LONGTEXT NULL,

    INDEX `products_category_id_foreign`(`category_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pulse_aggregates` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `bucket` INTEGER UNSIGNED NOT NULL,
    `period` MEDIUMINT UNSIGNED NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `key` MEDIUMTEXT NOT NULL,
    `key_hash` BINARY(16) NULL,
    `aggregate` VARCHAR(255) NOT NULL,
    `value` DECIMAL(20, 2) NOT NULL,
    `count` INTEGER UNSIGNED NULL,

    INDEX `pulse_aggregates_period_bucket_index`(`period`, `bucket`),
    INDEX `pulse_aggregates_period_type_aggregate_bucket_index`(`period`, `type`, `aggregate`, `bucket`),
    INDEX `pulse_aggregates_type_index`(`type`),
    UNIQUE INDEX `pulse_aggregates_bucket_period_type_aggregate_key_hash_unique`(`bucket`, `period`, `type`, `aggregate`, `key_hash`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pulse_entries` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `timestamp` INTEGER UNSIGNED NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `key` MEDIUMTEXT NOT NULL,
    `key_hash` BINARY(16) NULL,
    `value` BIGINT NULL,

    INDEX `pulse_entries_key_hash_index`(`key_hash`),
    INDEX `pulse_entries_timestamp_index`(`timestamp`),
    INDEX `pulse_entries_timestamp_type_key_hash_value_index`(`timestamp`, `type`, `key_hash`, `value`),
    INDEX `pulse_entries_type_index`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pulse_values` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `timestamp` INTEGER UNSIGNED NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `key` MEDIUMTEXT NOT NULL,
    `key_hash` BINARY(16) NULL,
    `value` MEDIUMTEXT NOT NULL,

    INDEX `pulse_values_timestamp_index`(`timestamp`),
    INDEX `pulse_values_type_index`(`type`),
    UNIQUE INDEX `pulse_values_type_key_hash_unique`(`type`, `key_hash`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repositories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `is_shop` BOOLEAN NOT NULL DEFAULT false,
    `agency_id` BIGINT UNSIGNED NULL,
    `admin_id` BIGINT UNSIGNED NULL,
    `province_id` SMALLINT UNSIGNED NULL,
    `county_id` SMALLINT UNSIGNED NULL,
    `district_id` SMALLINT UNSIGNED NULL,
    `address` VARCHAR(2048) NULL,
    `phone` VARCHAR(20) NULL,
    `location` VARCHAR(50) NULL,
    `allow_visit` BOOLEAN NOT NULL DEFAULT true,
    `postal_code` VARCHAR(20) NULL,
    `cities` LONGTEXT NULL,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'inactive',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `repositories_admin_id_foreign`(`admin_id`),
    INDEX `repositories_agency_id_foreign`(`agency_id`),
    INDEX `repositories_county_id_foreign`(`county_id`),
    INDEX `repositories_district_id_foreign`(`district_id`),
    INDEX `repositories_province_id_index`(`province_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repository_cart_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `visit_checked` BOOLEAN NOT NULL DEFAULT false,
    `cart_id` BIGINT UNSIGNED NULL,
    `variation_id` BIGINT UNSIGNED NULL,
    `repo_id` BIGINT UNSIGNED NULL,
    `qty` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `delivery_date` DATE NULL,
    `delivery_timestamp` VARCHAR(15) NULL,

    INDEX `repository_cart_items_cart_id_foreign`(`cart_id`),
    INDEX `repository_cart_items_repo_id_foreign`(`repo_id`),
    INDEX `repository_cart_items_shipping_id_foreign`(`shipping_id`),
    INDEX `repository_cart_items_variation_id_foreign`(`variation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repository_carts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `to_repo_id` BIGINT UNSIGNED NULL,
    `to_agency_id` BIGINT UNSIGNED NULL,
    `admin_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `repository_carts_admin_id_foreign`(`admin_id`),
    INDEX `repository_carts_to_agency_id_foreign`(`to_agency_id`),
    INDEX `repository_carts_to_repo_id_foreign`(`to_repo_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repository_order_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NULL,
    `title` VARCHAR(1024) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `shipping_method_id` BIGINT UNSIGNED NULL,
    `order_id` BIGINT UNSIGNED NULL,
    `variation_id` BIGINT UNSIGNED NULL,
    `repo_id` BIGINT UNSIGNED NULL,
    `qty` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `total_price` BIGINT UNSIGNED NOT NULL,
    `discount_price` BIGINT UNSIGNED NOT NULL,
    `pack_id` INTEGER UNSIGNED NULL,
    `total_weight` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `grade` ENUM('1', '2', '3') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `repository_order_items_order_id_foreign`(`order_id`),
    INDEX `repository_order_items_pack_id_foreign`(`pack_id`),
    INDEX `repository_order_items_repo_id_foreign`(`repo_id`),
    INDEX `repository_order_items_shipping_id_foreign`(`shipping_id`),
    INDEX `repository_order_items_shipping_method_id_foreign`(`shipping_method_id`),
    INDEX `repository_order_items_variation_id_foreign`(`variation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repository_orders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `from_repo_id` BIGINT UNSIGNED NULL,
    `from_agency_id` BIGINT UNSIGNED NULL,
    `to_repo_id` BIGINT UNSIGNED NULL,
    `to_agency_id` BIGINT UNSIGNED NULL,
    `transaction_id` BIGINT UNSIGNED NULL,
    `from_admin_id` BIGINT UNSIGNED NULL,
    `to_admin_id` BIGINT UNSIGNED NULL,
    `from_province_id` SMALLINT UNSIGNED NULL,
    `from_county_id` SMALLINT UNSIGNED NULL,
    `from_district_id` SMALLINT UNSIGNED NULL,
    `from_postal_code` VARCHAR(20) NULL,
    `from_location` VARCHAR(50) NULL,
    `from_address` VARCHAR(2048) NULL,
    `to_province_id` SMALLINT UNSIGNED NULL,
    `to_county_id` SMALLINT UNSIGNED NULL,
    `to_district_id` SMALLINT UNSIGNED NULL,
    `to_postal_code` VARCHAR(20) NULL,
    `to_location` VARCHAR(50) NULL,
    `to_address` VARCHAR(2048) NULL,
    `to_fullname` VARCHAR(200) NULL,
    `to_phone` VARCHAR(20) NULL,
    `from_fullname` VARCHAR(200) NULL,
    `from_phone` VARCHAR(20) NULL,
    `status` ENUM('request', 'pending', 'processing', 'ready', 'sending', 'delivered', 'canceled', 'rejected', 'refunded') NOT NULL,
    `total_items` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `total_discount` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_items_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `total_shipping_price` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `done_at` TIMESTAMP(0) NULL,
    `shipping_id` BIGINT UNSIGNED NULL,
    `shipping_method_id` BIGINT UNSIGNED NULL,
    `delivery_date` DATE NULL,
    `delivery_timestamp` VARCHAR(15) NULL,
    `pay_type` ENUM('online', 'local') NULL,
    `payed_at` TIMESTAMP(0) NULL,
    `distance` INTEGER UNSIGNED NULL,
    `tax_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `total_weight` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,

    INDEX `repository_orders_from_admin_id_foreign`(`from_admin_id`),
    INDEX `repository_orders_from_agency_id_foreign`(`from_agency_id`),
    INDEX `repository_orders_from_county_id_foreign`(`from_county_id`),
    INDEX `repository_orders_from_district_id_foreign`(`from_district_id`),
    INDEX `repository_orders_from_province_id_foreign`(`from_province_id`),
    INDEX `repository_orders_from_repo_id_foreign`(`from_repo_id`),
    INDEX `repository_orders_shipping_id_foreign`(`shipping_id`),
    INDEX `repository_orders_shipping_method_id_foreign`(`shipping_method_id`),
    INDEX `repository_orders_status_index`(`status`),
    INDEX `repository_orders_to_admin_id_foreign`(`to_admin_id`),
    INDEX `repository_orders_to_agency_id_foreign`(`to_agency_id`),
    INDEX `repository_orders_to_county_id_foreign`(`to_county_id`),
    INDEX `repository_orders_to_district_id_foreign`(`to_district_id`),
    INDEX `repository_orders_to_province_id_foreign`(`to_province_id`),
    INDEX `repository_orders_to_repo_id_foreign`(`to_repo_id`),
    INDEX `repository_orders_transaction_id_foreign`(`transaction_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repository_shops` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rubik` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `face_id` TINYINT UNSIGNED NOT NULL,
    `lang` VARCHAR(2) NULL,
    `title` VARCHAR(100) NULL,
    `icon` VARCHAR(1024) NULL,
    `link` VARCHAR(1024) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `samples` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    `agency_id` BIGINT UNSIGNED NULL,
    `product_id` BIGINT UNSIGNED NULL,
    `variation_id` BIGINT UNSIGNED NULL,
    `guarantee_months` TINYINT UNSIGNED NULL,
    `guarantee_expires_at` TIMESTAMP(0) NULL,
    `produced_at` TIMESTAMP(0) NULL,
    `barcode` VARCHAR(30) NULL,
    `admin_id` BIGINT UNSIGNED NULL,
    `operator_id` BIGINT UNSIGNED NULL,
    `customer_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `repo_id` BIGINT UNSIGNED NULL,

    INDEX `samples_admin_id_foreign`(`admin_id`),
    INDEX `samples_agency_id_foreign`(`agency_id`),
    INDEX `samples_customer_id_foreign`(`customer_id`),
    INDEX `samples_operator_id_foreign`(`operator_id`),
    INDEX `samples_product_id_foreign`(`product_id`),
    INDEX `samples_repo_id_foreign`(`repo_id`),
    INDEX `samples_variation_id_foreign`(`variation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sessions` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` BIGINT UNSIGNED NULL,
    `ip_address` VARCHAR(45) NULL,
    `user_agent` TEXT NULL,
    `payload` LONGTEXT NOT NULL,
    `last_activity` INTEGER NOT NULL,

    INDEX `sessions_last_activity_index`(`last_activity`),
    INDEX `sessions_user_id_index`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settings` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(30) NOT NULL,
    `value` VARCHAR(1024) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `settings_key_index`(`key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shipping_methods` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `repo_id` BIGINT UNSIGNED NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `products` LONGTEXT NULL,
    `cities` LONGTEXT NULL,
    `min_order_weight` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `per_weight_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `per_distance_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `base_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `free_from_price` INTEGER UNSIGNED NULL,
    `name` VARCHAR(200) NOT NULL,
    `description` VARCHAR(2048) NULL,
    `status` ENUM('inactive', 'active', 'block') NOT NULL DEFAULT 'inactive',
    `pay_type` ENUM('online', 'local') NOT NULL DEFAULT 'online',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `timestamps` LONGTEXT NULL,
    `shipping_agency_id` BIGINT UNSIGNED NULL,

    INDEX `shipping_methods_agency_id_foreign`(`agency_id`),
    INDEX `shipping_methods_repo_id_foreign`(`repo_id`),
    INDEX `shipping_methods_shipping_agency_id_foreign`(`shipping_agency_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shippings` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `driver_id` BIGINT UNSIGNED NULL,
    `car_id` BIGINT UNSIGNED NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `status` ENUM('preparing', 'sending', 'done', 'canceled') NOT NULL,
    `order_delivered_qty` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    `order_qty` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    `done_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `shippings_agency_id_foreign`(`agency_id`),
    INDEX `shippings_car_id_foreign`(`car_id`),
    INDEX `shippings_driver_id_foreign`(`driver_id`),
    INDEX `shippings_status_index`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shops` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sliders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(1024) NULL,
    `description` VARCHAR(2048) NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sms_verify` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `phone` VARCHAR(20) NOT NULL,
    `code` VARCHAR(5) NOT NULL,
    `verified` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ticket_chats` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `from_type` VARCHAR(191) NOT NULL,
    `from_id` BIGINT UNSIGNED NOT NULL,
    `ticket_id` BIGINT UNSIGNED NOT NULL,
    `from_seen` BOOLEAN NOT NULL DEFAULT false,
    `to_seen` BOOLEAN NOT NULL DEFAULT false,
    `message` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `ticket_chats_from_id_foreign`(`from_id`),
    INDEX `ticket_chats_from_type_from_id_index`(`from_type`, `from_id`),
    INDEX `ticket_chats_ticket_id_foreign`(`ticket_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `agency_id` BIGINT UNSIGNED NULL,
    `subject` VARCHAR(100) NOT NULL,
    `status` ENUM('review', 'closed', 'responded') NOT NULL,
    `from_id` BIGINT UNSIGNED NOT NULL,
    `from_type` ENUM('admin', 'operator', 'user', 'agency') NULL,
    `to_id` BIGINT UNSIGNED NOT NULL,
    `to_type` ENUM('admin', 'operator', 'user', 'agency') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `tickets_agency_id_foreign`(`agency_id`),
    INDEX `tickets_from_id_index`(`from_id`),
    INDEX `tickets_from_type_index`(`from_type`),
    INDEX `tickets_to_id_index`(`to_id`),
    INDEX `tickets_to_type_index`(`to_type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `type` ENUM('pay', 'profit', 'settlement', 'charge', 'shipping') NULL,
    `for_type` ENUM('order', 'repo-order', 'admin', 'user', 'agency', 'operator') NULL,
    `for_id` BIGINT UNSIGNED NULL,
    `from_type` ENUM('admin', 'operator', 'user', 'agency') NULL,
    `from_id` BIGINT UNSIGNED NULL,
    `to_type` ENUM('admin', 'operator', 'user', 'agency') NULL,
    `to_id` BIGINT UNSIGNED NULL,
    `info` VARCHAR(2048) NULL,
    `amount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `pay_id` VARCHAR(50) NULL,
    `coupon` VARCHAR(10) NULL,
    `pay_gate` VARCHAR(10) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `payed_at` TIMESTAMP(0) NULL,

    INDEX `transactions_for_id_index`(`for_id`),
    INDEX `transactions_pay_id_index`(`pay_id`),
    INDEX `transactions_type_index`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_financials` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NULL,
    `wallet` BIGINT NOT NULL DEFAULT 0,
    `card` VARCHAR(16) NULL,
    `sheba` VARCHAR(24) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `user_financials_user_id_index`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NULL,
    `email_verified_at` TIMESTAMP(0) NULL,
    `phone` VARCHAR(20) NULL,
    `phone_verified` BOOLEAN NOT NULL DEFAULT false,
    `password` VARCHAR(200) NULL,
    `two_factor_secret` TEXT NULL,
    `two_factor_recovery_codes` TEXT NULL,
    `two_factor_confirmed_at` TIMESTAMP(0) NULL,
    `city_id` SMALLINT UNSIGNED NULL,
    `telegram_id` VARCHAR(50) NULL,
    `bale_id` VARCHAR(50) NULL,
    `soroush_id` VARCHAR(50) NULL,
    `role` ENUM('us') NOT NULL DEFAULT 'us',
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_block` BOOLEAN NOT NULL DEFAULT false,
    `status` ENUM('active', 'inactive', 'block') NOT NULL DEFAULT 'active',
    `wallet_active` BOOLEAN NOT NULL DEFAULT false,
    `notifications` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `meta_wallet` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ref_id` VARCHAR(10) NULL,
    `push_id` VARCHAR(20) NULL,
    `expires_at` TIMESTAMP(0) NULL,
    `settings` LONGTEXT NULL,
    `addresses` LONGTEXT NULL,
    `access` VARCHAR(20) NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `step` TINYINT NULL,

    UNIQUE INDEX `users_email_unique`(`email`),
    INDEX `users_city_id_foreign`(`city_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `variations` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `tags` VARCHAR(200) NULL,
    `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    `product_id` BIGINT UNSIGNED NULL,
    `grade` ENUM('1', '2', '3') NULL,
    `pack_id` INTEGER UNSIGNED NULL,
    `agency_id` BIGINT UNSIGNED NULL,
    `repo_id` BIGINT UNSIGNED NULL,
    `category_id` INTEGER UNSIGNED NULL,
    `in_repo` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `in_shop` DECIMAL(8, 3) NOT NULL DEFAULT 0.000,
    `min_allowed` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `weight` DECIMAL(8, 3) NULL,
    `price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `auction_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `in_auction` BOOLEAN NOT NULL DEFAULT false,
    `agency_level` ENUM('0', '1', '2') NULL,
    `unit` ENUM('piece', 'kg') NOT NULL DEFAULT 'piece',
    `sell_count` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `description` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `variations_agency_id_foreign`(`agency_id`),
    INDEX `variations_category_id_foreign`(`category_id`),
    INDEX `variations_pack_id_foreign`(`pack_id`),
    INDEX `variations_product_id_foreign`(`product_id`),
    INDEX `variations_repo_id_foreign`(`repo_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `admin_financials` ADD CONSTRAINT `admin_financials_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `admins` ADD CONSTRAINT `admins_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `agencies` ADD CONSTRAINT `agencies_county_id_foreign` FOREIGN KEY (`county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `agencies` ADD CONSTRAINT `agencies_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `agencies` ADD CONSTRAINT `agencies_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `agencies` ADD CONSTRAINT `agencies_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `agency_financials` ADD CONSTRAINT `agency_financials_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `articles` ADD CONSTRAINT `articles_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cars` ADD CONSTRAINT `cars_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cars` ADD CONSTRAINT `cars_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cart_items` ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cart_items` ADD CONSTRAINT `cart_items_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cart_items` ADD CONSTRAINT `cart_items_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cart_items` ADD CONSTRAINT `cart_items_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `carts` ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cities` ADD CONSTRAINT `cities_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `coupons` ADD CONSTRAINT `coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `drivers` ADD CONSTRAINT `drivers_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `packs`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_county_id_foreign` FOREIGN KEY (`county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `partnerships` ADD CONSTRAINT `partnerships_county_id_foreign` FOREIGN KEY (`county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `partnerships` ADD CONSTRAINT `partnerships_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `payments` ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repositories` ADD CONSTRAINT `repositories_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repositories` ADD CONSTRAINT `repositories_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repositories` ADD CONSTRAINT `repositories_county_id_foreign` FOREIGN KEY (`county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repositories` ADD CONSTRAINT `repositories_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repositories` ADD CONSTRAINT `repositories_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_cart_items` ADD CONSTRAINT `repository_cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `repository_carts`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_cart_items` ADD CONSTRAINT `repository_cart_items_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_cart_items` ADD CONSTRAINT `repository_cart_items_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_cart_items` ADD CONSTRAINT `repository_cart_items_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_carts` ADD CONSTRAINT `repository_carts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_carts` ADD CONSTRAINT `repository_carts_to_agency_id_foreign` FOREIGN KEY (`to_agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_carts` ADD CONSTRAINT `repository_carts_to_repo_id_foreign` FOREIGN KEY (`to_repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_order_items` ADD CONSTRAINT `repository_order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `repository_orders`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_order_items` ADD CONSTRAINT `repository_order_items_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `packs`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_order_items` ADD CONSTRAINT `repository_order_items_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_order_items` ADD CONSTRAINT `repository_order_items_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_order_items` ADD CONSTRAINT `repository_order_items_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_admin_id_foreign` FOREIGN KEY (`from_admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_agency_id_foreign` FOREIGN KEY (`from_agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_county_id_foreign` FOREIGN KEY (`from_county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_district_id_foreign` FOREIGN KEY (`from_district_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_province_id_foreign` FOREIGN KEY (`from_province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_from_repo_id_foreign` FOREIGN KEY (`from_repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_admin_id_foreign` FOREIGN KEY (`to_admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_agency_id_foreign` FOREIGN KEY (`to_agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_county_id_foreign` FOREIGN KEY (`to_county_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_district_id_foreign` FOREIGN KEY (`to_district_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_province_id_foreign` FOREIGN KEY (`to_province_id`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_to_repo_id_foreign` FOREIGN KEY (`to_repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repository_orders` ADD CONSTRAINT `repository_orders_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_operator_id_foreign` FOREIGN KEY (`operator_id`) REFERENCES `admins`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `samples` ADD CONSTRAINT `samples_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shipping_methods` ADD CONSTRAINT `shipping_methods_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shipping_methods` ADD CONSTRAINT `shipping_methods_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shipping_methods` ADD CONSTRAINT `shipping_methods_shipping_agency_id_foreign` FOREIGN KEY (`shipping_agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shippings` ADD CONSTRAINT `shippings_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shippings` ADD CONSTRAINT `shippings_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shippings` ADD CONSTRAINT `shippings_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `ticket_chats` ADD CONSTRAINT `ticket_chats_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `ticket_chats` ADD CONSTRAINT `ticket_chats_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `variations` ADD CONSTRAINT `variations_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `variations` ADD CONSTRAINT `variations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `variations` ADD CONSTRAINT `variations_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `packs`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `variations` ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `variations` ADD CONSTRAINT `variations_repo_id_foreign` FOREIGN KEY (`repo_id`) REFERENCES `repositories`(`id`) ON DELETE NO ACTION ON UPDATE RESTRICT;

