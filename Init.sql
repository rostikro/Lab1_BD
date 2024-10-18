CREATE TABLE `users` (
  `Id` varchar(255) PRIMARY KEY,
  `Username` varchar(255),
  `Email` varchar(255),
  `Password` varchar(255),
  `IsDeleted` bool
);

CREATE TABLE `addresses` (
  `Id` int PRIMARY KEY,
  `UserId` varchar(255),
  `Street` varchar(255),
  `Apartment` varchar(255),
  `City` varchar(255),
  `Province` varchar(255),
  `PostCode` varchar(255),
  `Country` varchar(255),
  `IsDefault` bool,
  `IsDeleted` bool
);

CREATE TABLE `products` (
  `Id` int PRIMARY KEY,
  `CategoryId` int,
  `Name` varchar(255),
  `Price` int,
  `Description` varchar(255),
  `Stock` int,
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `product_categories` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `product_images` (
  `Id` int PRIMARY KEY,
  `ProductId` int,
  `Url` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `specs` (
  `Id` int PRIMARY KEY,
  `CategoryId` int,
  `Name` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `specs_options` (
  `Id` int PRIMARY KEY,
  `SpecId` int,
  `ProductId` int,
  `Value` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `shopping_carts` (
  `Id` int PRIMARY KEY,
  `UserId` varchar(255),
  `IsDeleted` bool
);

CREATE TABLE `shopping_cart_products` (
  `Id` int PRIMARY KEY,
  `CartId` int,
  `ProductId` int,
  `Quantity` int,
  `IsDeleted` bool
);

CREATE TABLE `orders` (
  `Id` int PRIMARY KEY,
  `UserId` varchar(255),
  `OrderDate` date,
  `Total` int,
  `StatusId` int,
  `IsDeleted` bool
);

CREATE TABLE `order_statuses` (
  `Id` int PRIMARY KEY,
  `Status` varchar(255),
  `IsDeleted` bool
);

CREATE TABLE `order_products` (
  `Id` int PRIMARY KEY,
  `OrderId` int,
  `ProductId` int,
  `Price` int,
  `Quantity` int,
  `IsDeleted` bool
);

CREATE TABLE `shipping_info` (
  `Id` int PRIMARY KEY,
  `OrderId` int,
  `Street` varchar(255),
  `Apartment` varchar(255),
  `City` varchar(255),
  `Province` varchar(255),
  `PostCode` varchar(255),
  `Country` varchar(255),
  `IsDeleted` bool
);

CREATE TABLE `roles` (
  `Id` varchar(255) PRIMARY KEY,
  `Name` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool
);

CREATE TABLE `users_roles` (
  `UserId` varchar(255),
  `RoleId` varchar(255),
  `ModifiedBy` varchar(255),
  `ModifiedAt` timestamp,
  `IsDeleted` bool,
  PRIMARY KEY (`UserId`, `RoleId`)
);

ALTER TABLE `addresses` ADD FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

ALTER TABLE `products` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `product_categories` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `products` ADD FOREIGN KEY (`CategoryId`) REFERENCES `product_categories` (`Id`);

ALTER TABLE `product_images` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `product_images` ADD FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`);

ALTER TABLE `specs` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `specs_options` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `specs` ADD FOREIGN KEY (`CategoryId`) REFERENCES `product_categories` (`Id`);

ALTER TABLE `specs_options` ADD FOREIGN KEY (`SpecId`) REFERENCES `specs` (`Id`);

ALTER TABLE `specs_options` ADD FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`);

ALTER TABLE `shopping_carts` ADD FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

ALTER TABLE `shopping_cart_products` ADD FOREIGN KEY (`CartId`) REFERENCES `shopping_carts` (`Id`);

ALTER TABLE `shopping_cart_products` ADD FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`StatusId`) REFERENCES `order_statuses` (`Id`);

ALTER TABLE `order_products` ADD FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`);

ALTER TABLE `order_products` ADD FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`);

ALTER TABLE `shipping_info` ADD FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`);

ALTER TABLE `roles` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `users_roles` ADD FOREIGN KEY (`ModifiedBy`) REFERENCES `users` (`Id`);

ALTER TABLE `users_roles` ADD FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

ALTER TABLE `users_roles` ADD FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`);
