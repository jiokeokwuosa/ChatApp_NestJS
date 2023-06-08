/*
  Warnings:

  - You are about to alter the column `id` on the `User` table. The data in that column will be cast from `Int` to `String`. This cast may fail. Please make sure the data in the column can be cast.
  - You are about to alter the column `id` on the `Message` table. The data in that column will be cast from `Int` to `String`. This cast may fail. Please make sure the data in the column can be cast.

*/
-- RedefineTables
CREATE TABLE "_prisma_new_User" (
    "id" STRING NOT NULL,
    "client_id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);
DROP INDEX "User_client_id_key";
INSERT INTO "_prisma_new_User" ("client_id","created_at","id","name","updated_at") SELECT "client_id","created_at","id","name","updated_at" FROM "User";
DROP TABLE "User" CASCADE;
ALTER TABLE "_prisma_new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_client_id_key" ON "User"("client_id");
CREATE TABLE "_prisma_new_Message" (
    "id" STRING NOT NULL,
    "content" STRING NOT NULL,
    "author_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);
INSERT INTO "_prisma_new_Message" ("author_id","content","created_at","id","updated_at") SELECT "author_id","content","created_at","id","updated_at" FROM "Message";
DROP TABLE "Message" CASCADE;
ALTER TABLE "_prisma_new_Message" RENAME TO "Message";
ALTER TABLE "Message" ADD CONSTRAINT "Message_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
