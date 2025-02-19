/*
  Warnings:

  - The values [FISNISHED] on the enum `OrderStatus` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `CreatedAt` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `UpdatedAt` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `restarauntId` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `CreatedAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `MenuCategoryId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `UpdatedAt` on the `Product` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `MenuCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `restaurantId` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menuCategoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "OrderStatus_new" AS ENUM ('PENDING', 'IN_PREPARATION', 'FINISHED');
ALTER TABLE "Order" ALTER COLUMN "status" TYPE "OrderStatus_new" USING ("status"::text::"OrderStatus_new");
ALTER TYPE "OrderStatus" RENAME TO "OrderStatus_old";
ALTER TYPE "OrderStatus_new" RENAME TO "OrderStatus";
DROP TYPE "OrderStatus_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_restarauntId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_MenuCategoryId_fkey";

-- AlterTable
ALTER TABLE "MenuCategory" DROP COLUMN "CreatedAt",
DROP COLUMN "UpdatedAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "restarauntId",
ADD COLUMN     "restaurantId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "CreatedAt",
DROP COLUMN "MenuCategoryId",
DROP COLUMN "UpdatedAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "menuCategoryId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCategoryId_fkey" FOREIGN KEY ("menuCategoryId") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
