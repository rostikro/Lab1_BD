DELIMITER |
CREATE PROCEDURE add_new_product(
  IN p_category_id INT,
  IN p_name VARCHAR(255),
  IN p_price INT,
  IN p_description VARCHAR(255),
  IN p_stock INT,
  IN p_modified_by INT
)
BEGIN
  INSERT INTO `products` (`CategoryId`, `Name`, `Price`, `Description`, `Stock`, `ModifiedBy`, `ModifiedAt`, `IsDeleted`)
  VALUES (p_category_id, p_name, p_price, p_description, p_stock, p_modified_by, NOW(), FALSE);
END |
DELIMITER ;

DELIMITER |
CREATE PROCEDURE add_product_category(
  IN p_name VARCHAR(255),
  IN p_modified_by INT
)
BEGIN
    INSERT INTO `product_categories` (`Name`, `ModifiedBy`, `ModifiedAt`, `IsDeleted`)
    VALUES (p_name, p_modified_by, NOW(), FALSE);
END |
DELIMITER ;

DELIMITER |
CREATE PROCEDURE add_product_image(
  IN p_product_id INT,
  IN p_url VARCHAR(255),
  IN p_modified_by INT
)
BEGIN
    INSERT INTO `product_images` (`ProductId`, `Url`, `ModifiedBy`, `ModifiedAt`, `IsDeleted`)
    VALUES (p_product_id, p_url, p_modified_by, NOW(), FALSE);
END |
DELIMITER ;

DELIMITER |
CREATE PROCEDURE add_new_spec(
  IN p_category_id INT,
  IN p_name VARCHAR(255),
  IN p_modified_by INT
)
BEGIN
  INSERT INTO specs (CategoryId, Name, ModifiedBy, ModifiedAt, IsDeleted)
  VALUES (p_category_id, p_name, p_modified_by, NOW(), FALSE);
END |
DELIMITER ;

DELIMITER |
CREATE PROCEDURE add_role_to_user(
  IN p_user_id INT,
  IN p_role_id INT,
  IN p_modified_by INT
)
BEGIN
  INSERT INTO users_roles (UserId, RoleId, ModifiedBy, ModifiedAt, IsDeleted)
  VALUES (p_user_id, p_role_id, p_modified_by, NOW(), FALSE);
END |
DELIMITER ;
