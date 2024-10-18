
/* This function returns buy statistics on concrete product */
DELIMITER |
CREATE FUNCTION find_product_buy_stats(product_id INT)
RETURNS INT
BEGIN
  DECLARE buy_count INT;

  SELECT SUM(op.Quantity)
    INTO buy_count
    FROM `order_products` op
    JOIN `orders` o ON op.OrderId = o.Id
    WHERE op.ProductId = product_id AND o.IsDeleted = FALSE AND op.IsDeleted = FALSE;

  RETURN buy_count;
END |
DELIMITER ;

/* This function returns count of orders that currently has the "Pending" status */
DELIMITER |
CREATE FUNCTION count_pending_orders()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE pending_order_count INT;

  SELECT COUNT(*)
    INTO pending_order_count
    FROM `orders` o
    JOIN `order_statuses` os ON o.StatusId = os.Id
    WHERE os.Status = 'Pending' AND o.IsDeleted = FALSE AND os.IsDeleted = FALSE;

  RETURN pending_order_count;
END |
DELIMITER ;

/* This function returns the average check of all orders */
DELIMITER |
CREATE FUNCTION average_order_check()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE avg_check DECIMAL(10, 2);

  SELECT AVG(Total)
    INTO avg_check
    FROM `orders`
    WHERE IsDeleted = FALSE;

  RETURN avg_check;
END |
DELIMITER ;

/* This function returns users count that have a specific role */
DELIMITER |
CREATE FUNCTION count_users_with_role(p_role_name VARCHAR(255))
RETURNS INT
BEGIN
  DECLARE user_count INT;

  SELECT COUNT(DISTINCT ur.UserId)
  INTO user_count
  FROM users_roles ur
  JOIN roles r ON ur.RoleId = r.Id
  WHERE r.Name = p_role_name AND r.IsDeleted = FALSE AND ur.IsDeleted = FALSE;

  RETURN user_count;
END |
DELIMITER ;
