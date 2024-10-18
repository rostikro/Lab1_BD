delimiter |

CREATE TRIGGER add_shopping_cart_for_new_user AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO shopping_carts (UserId)
	VALUES (NEW.Id);
END;
|

delimiter ;