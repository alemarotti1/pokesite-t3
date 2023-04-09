-- CreateTable
CREATE TABLE `atributes` (
    `id` INTEGER NOT NULL,
    `basal_health` INTEGER NULL,
    `bonus_health` INTEGER NULL,
    `extra_health` INTEGER NULL,
    `basal_attack` INTEGER NULL,
    `bonus_attack` INTEGER NULL,
    `extra_attack` INTEGER NULL,
    `basal_sp_attack` INTEGER NULL,
    `bonus_sp_attack` INTEGER NULL,
    `extra_sp_attack` INTEGER NULL,
    `basal_defense` INTEGER NULL,
    `bonus_defense` INTEGER NULL,
    `extra_defense` INTEGER NULL,
    `basal_sp_defense` INTEGER NULL,
    `bonus_sp_defense` INTEGER NULL,
    `extra_sp_defense` INTEGER NULL,
    `basal_speed` INTEGER NULL,
    `bonus_speed` INTEGER NULL,
    `extra_speed` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `player` (
    `username` VARCHAR(64) NOT NULL,
    `password` VARCHAR(64) NULL,
    `master` TINYINT NULL,

    PRIMARY KEY (`username`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trainer` (
    `username` VARCHAR(64) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `level` INTEGER NULL,
    `age` INTEGER NULL,
    `weight` DECIMAL(5, 2) NULL,
    `height` INTEGER NULL,
    `atributes_id` INTEGER NOT NULL,

    INDEX `fk_trainer_atributes1`(`atributes_id`),
    PRIMARY KEY (`username`, `name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `attack` (
    `id_attack` INTEGER NOT NULL,
    `name` VARCHAR(64) NULL,
    `range` INTEGER NULL,
    `area` INTEGER NULL,
    `damage` VARCHAR(100) NULL,
    `type_id_type` INTEGER NOT NULL,
    `type_damage` VARCHAR(64) NULL,

    INDEX `fk_attack_type1`(`type_id_type`),
    PRIMARY KEY (`id_attack`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `attack_has_effect` (
    `id_attack` INTEGER NOT NULL,
    `id_effect` INTEGER NOT NULL,

    INDEX `fk_attack_has_effect_effect1`(`id_effect`),
    PRIMARY KEY (`id_attack`, `id_effect`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bag` (
    `trainer_player_usuario` VARCHAR(64) NOT NULL,
    `trainer_nome` VARCHAR(100) NOT NULL,
    `spaces` INTEGER NULL,

    PRIMARY KEY (`trainer_player_usuario`, `trainer_nome`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bag_has_item` (
    `bag_trainer_player_usuario` VARCHAR(64) NOT NULL,
    `bag_trainer_nome` VARCHAR(100) NOT NULL,
    `item_id_item` INTEGER NOT NULL,

    INDEX `fk_bag_has_item_item1`(`item_id_item`),
    PRIMARY KEY (`bag_trainer_player_usuario`, `bag_trainer_nome`, `item_id_item`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `biome` (
    `id_biome` INTEGER NOT NULL,
    `name` VARCHAR(64) NULL,

    PRIMARY KEY (`id_biome`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `biome_has_pokemon_species` (
    `biome_id_biome` INTEGER NOT NULL,
    `pokemon_species_id_pokemon_species` INTEGER NOT NULL,

    INDEX `fk_biome_has_pokemon_species_pokemon_species1`(`pokemon_species_id_pokemon_species`),
    PRIMARY KEY (`biome_id_biome`, `pokemon_species_id_pokemon_species`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `box` (
    `trainer_player_usuario` VARCHAR(64) NOT NULL,
    `trainer_nome` VARCHAR(100) NOT NULL,
    `pokemon_id_pokemon` INTEGER NOT NULL,

    INDEX `fk_trainer_has_pokemon_pokemon1`(`pokemon_id_pokemon`),
    PRIMARY KEY (`trainer_player_usuario`, `trainer_nome`, `pokemon_id_pokemon`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `class` (
    `id_class` INTEGER NOT NULL,
    `name` VARCHAR(100) NULL,
    `required_attributes_id` INTEGER NOT NULL,

    INDEX `fk_class_atributes1`(`required_attributes_id`),
    PRIMARY KEY (`id_class`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trainer_class` (
    `trainer_user` VARCHAR(64) NOT NULL,
    `trainer_name` VARCHAR(100) NOT NULL,
    `id_class` INTEGER NOT NULL,

    INDEX `fk_trainer_has_class_class1`(`id_class`),
    PRIMARY KEY (`trainer_user`, `trainer_name`, `id_class`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `effect` (
    `id_effect` INTEGER NOT NULL,
    `name` VARCHAR(64) NULL,

    PRIMARY KEY (`id_effect`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `effectivness` (
    `id_type` INTEGER NOT NULL,
    `id_type1` INTEGER NOT NULL,
    `attack` TINYINT NULL,

    INDEX `fk_type_has_type_type2`(`id_type1`),
    PRIMARY KEY (`id_type`, `id_type1`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item` (
    `id_item` INTEGER NOT NULL,
    `name` VARCHAR(64) NULL,
    `type` VARCHAR(64) NULL,
    `description` VARCHAR(1000) NULL,

    PRIMARY KEY (`id_item`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learns` (
    `id_pokemon_species` INTEGER NOT NULL,
    `id_attack` INTEGER NOT NULL,
    `method` VARCHAR(64) NULL,
    `level_learned` INTEGER NULL,

    INDEX `fk_pokemon_species_has_attacks_attacks1`(`id_attack`),
    PRIMARY KEY (`id_pokemon_species`, `id_attack`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `map` (
    `id_map` INTEGER NOT NULL,
    `id_biome` INTEGER NOT NULL,
    `description` VARCHAR(10000) NULL,

    INDEX `fk_map_biome1`(`id_biome`),
    PRIMARY KEY (`id_map`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `moveset` (
    `id_pokemon` INTEGER NOT NULL,
    `id_attack` INTEGER NOT NULL,

    INDEX `fk_pokemon_has_attacks_attacks1`(`id_attack`),
    PRIMARY KEY (`id_pokemon`, `id_attack`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `obtained_talent` (
    `trainer_class_trainer_player_usuario` VARCHAR(64) NOT NULL,
    `trainer_class_trainer_nome` VARCHAR(100) NOT NULL,
    `trainer_class_class_id_class` INTEGER NOT NULL,
    `talent_id_talent` INTEGER NOT NULL,

    INDEX `fk_trainer_class_has_talent_talent1`(`talent_id_talent`),
    PRIMARY KEY (`trainer_class_trainer_player_usuario`, `trainer_class_trainer_nome`, `trainer_class_class_id_class`, `talent_id_talent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pokemon_species` (
    `id_pokemon_species` INTEGER NOT NULL,
    `atributes_id` INTEGER NOT NULL,
    `strenght` INTEGER NULL,
    `intelligence` INTEGER NULL,
    `jump` INTEGER NULL,
    `id_type1` INTEGER NULL,
    `id_type2` INTEGER NULL,

    INDEX `fk_pokemon_species_atributes1`(`atributes_id`),
    INDEX `fk_pokemon_species_type1`(`id_type1`),
    INDEX `fk_pokemon_species_type2`(`id_type2`),
    PRIMARY KEY (`id_pokemon_species`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pokemon` (
    `id_pokemon` INTEGER NOT NULL,
    `atributes_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NULL,
    `level` INTEGER NULL,
    `xp` INTEGER NULL,
    `size_variation_percent` DECIMAL(3, 2) NULL,
    `gender` VARCHAR(1) NULL,
    `id_species` INTEGER NOT NULL,

    INDEX `fk_pokemon_atributes1`(`atributes_id`),
    INDEX `fk_pokemon_pokemon_species1`(`id_species`),
    PRIMARY KEY (`id_pokemon`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `talent` (
    `id_talent` INTEGER NOT NULL,
    `description` VARCHAR(64) NULL,

    PRIMARY KEY (`id_talent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `type` (
    `id_type` INTEGER NOT NULL,
    `name` VARCHAR(64) NULL,

    PRIMARY KEY (`id_type`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `trainer` ADD CONSTRAINT `fk_trainer_atributes1` FOREIGN KEY (`atributes_id`) REFERENCES `atributes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trainer` ADD CONSTRAINT `fk_trainer_player` FOREIGN KEY (`username`) REFERENCES `player`(`username`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `attack` ADD CONSTRAINT `fk_attack_type1` FOREIGN KEY (`type_id_type`) REFERENCES `type`(`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `attack_has_effect` ADD CONSTRAINT `fk_attack_has_effect_attack1` FOREIGN KEY (`id_attack`) REFERENCES `attack`(`id_attack`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `attack_has_effect` ADD CONSTRAINT `fk_attack_has_effect_effect1` FOREIGN KEY (`id_effect`) REFERENCES `effect`(`id_effect`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bag` ADD CONSTRAINT `fk_trainer_bag` FOREIGN KEY (`trainer_player_usuario`, `trainer_nome`) REFERENCES `trainer`(`username`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `bag_has_item` ADD CONSTRAINT `fk_bag_has_item_bag1` FOREIGN KEY (`bag_trainer_player_usuario`, `bag_trainer_nome`) REFERENCES `bag`(`trainer_player_usuario`, `trainer_nome`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bag_has_item` ADD CONSTRAINT `fk_bag_has_item_item1` FOREIGN KEY (`item_id_item`) REFERENCES `item`(`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `biome_has_pokemon_species` ADD CONSTRAINT `fk_biome_has_pokemon_species_biome1` FOREIGN KEY (`biome_id_biome`) REFERENCES `biome`(`id_biome`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `biome_has_pokemon_species` ADD CONSTRAINT `fk_biome_has_pokemon_species_pokemon_species1` FOREIGN KEY (`pokemon_species_id_pokemon_species`) REFERENCES `pokemon_species`(`id_pokemon_species`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `box` ADD CONSTRAINT `fk_trainer_has_pokemon_pokemon1` FOREIGN KEY (`pokemon_id_pokemon`) REFERENCES `pokemon`(`id_pokemon`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `box` ADD CONSTRAINT `fk_trainer_has_pokemon_trainer1` FOREIGN KEY (`trainer_player_usuario`, `trainer_nome`) REFERENCES `trainer`(`username`, `name`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `class` ADD CONSTRAINT `fk_class_atributes1` FOREIGN KEY (`required_attributes_id`) REFERENCES `atributes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trainer_class` ADD CONSTRAINT `fk_trainer_has_class_class1` FOREIGN KEY (`id_class`) REFERENCES `class`(`id_class`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trainer_class` ADD CONSTRAINT `fk_trainer_has_class_trainer1` FOREIGN KEY (`trainer_user`, `trainer_name`) REFERENCES `trainer`(`username`, `name`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `effectivness` ADD CONSTRAINT `fk_type_has_type_type1` FOREIGN KEY (`id_type`) REFERENCES `type`(`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `effectivness` ADD CONSTRAINT `fk_type_has_type_type2` FOREIGN KEY (`id_type1`) REFERENCES `type`(`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `learns` ADD CONSTRAINT `fk_pokemon_species_has_attacks_attacks1` FOREIGN KEY (`id_attack`) REFERENCES `attack`(`id_attack`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `learns` ADD CONSTRAINT `fk_pokemon_species_has_attacks_pokemon_species1` FOREIGN KEY (`id_pokemon_species`) REFERENCES `pokemon_species`(`id_pokemon_species`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `map` ADD CONSTRAINT `fk_map_biome1` FOREIGN KEY (`id_biome`) REFERENCES `biome`(`id_biome`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `moveset` ADD CONSTRAINT `fk_pokemon_has_attacks_attacks1` FOREIGN KEY (`id_attack`) REFERENCES `attack`(`id_attack`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `moveset` ADD CONSTRAINT `fk_pokemon_has_attacks_pokemon1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon`(`id_pokemon`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obtained_talent` ADD CONSTRAINT `fk_trainer_class_has_talent_talent1` FOREIGN KEY (`talent_id_talent`) REFERENCES `talent`(`id_talent`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obtained_talent` ADD CONSTRAINT `fk_trainer_class_has_talent_trainer_class1` FOREIGN KEY (`trainer_class_trainer_player_usuario`, `trainer_class_trainer_nome`, `trainer_class_class_id_class`) REFERENCES `trainer_class`(`trainer_user`, `trainer_name`, `id_class`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemon_species` ADD CONSTRAINT `fk_pokemon_species_atributes1` FOREIGN KEY (`atributes_id`) REFERENCES `atributes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemon_species` ADD CONSTRAINT `fk_pokemon_species_type1` FOREIGN KEY (`id_type1`) REFERENCES `type`(`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemon_species` ADD CONSTRAINT `fk_pokemon_species_type2` FOREIGN KEY (`id_type2`) REFERENCES `type`(`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemon` ADD CONSTRAINT `fk_pokemon_atributes1` FOREIGN KEY (`atributes_id`) REFERENCES `atributes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemon` ADD CONSTRAINT `fk_pokemon_pokemon_species1` FOREIGN KEY (`id_species`) REFERENCES `pokemon_species`(`id_pokemon_species`) ON DELETE CASCADE ON UPDATE CASCADE;
