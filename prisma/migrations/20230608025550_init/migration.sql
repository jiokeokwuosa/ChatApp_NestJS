-- CreateTable
CREATE TABLE "User" (
    "id" INT4 NOT NULL DEFAULT unique_rowid(),
    "client_id" STRING NOT NULL,
    "name" STRING,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" INT4 NOT NULL DEFAULT unique_rowid(),
    "content" STRING,
    "author_id" INT4,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_client_id_key" ON "User"("client_id");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
