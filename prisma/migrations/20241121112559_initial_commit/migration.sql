-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "password" TEXT NOT NULL,
    "company_name" VARCHAR(70),
    "phone_number" TEXT,
    "address" TEXT,
    "department" TEXT,
    "role" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drawing_2D" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "approve" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Drawing_2D_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drawing_3D" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "approve" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Drawing_3D_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drawing_MB" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "approve" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Drawing_MB_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drawing_AB" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "approve" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Drawing_AB_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drawing_BOQ" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "approve" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Drawing_BOQ_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarkerGroup2D" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drawing2DId" INTEGER NOT NULL,

    CONSTRAINT "MarkerGroup2D_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarkerGroup3D" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drawing3DId" INTEGER NOT NULL,

    CONSTRAINT "MarkerGroup3D_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarkerGroupMB" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drawingMbId" INTEGER NOT NULL,

    CONSTRAINT "MarkerGroupMB_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarkerGroupAB" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drawingAbId" INTEGER NOT NULL,

    CONSTRAINT "MarkerGroupAB_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarkerGroupBoq" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drawingBoqId" INTEGER NOT NULL,

    CONSTRAINT "MarkerGroupBoq_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "accessControl" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "department" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'employee',
    "company_name" TEXT,
    "phone_number" TEXT,

    CONSTRAINT "accessControl_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Kanban_Cards" (
    "id" SERIAL NOT NULL,
    "column" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Kanban_Cards_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_company_name_key" ON "users"("company_name");

-- CreateIndex
CREATE UNIQUE INDEX "accessControl_email_key" ON "accessControl"("email");

-- AddForeignKey
ALTER TABLE "Drawing_2D" ADD CONSTRAINT "Drawing_2D_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drawing_3D" ADD CONSTRAINT "Drawing_3D_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drawing_MB" ADD CONSTRAINT "Drawing_MB_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drawing_AB" ADD CONSTRAINT "Drawing_AB_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drawing_BOQ" ADD CONSTRAINT "Drawing_BOQ_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarkerGroup2D" ADD CONSTRAINT "MarkerGroup2D_drawing2DId_fkey" FOREIGN KEY ("drawing2DId") REFERENCES "Drawing_2D"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarkerGroup3D" ADD CONSTRAINT "MarkerGroup3D_drawing3DId_fkey" FOREIGN KEY ("drawing3DId") REFERENCES "Drawing_3D"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarkerGroupMB" ADD CONSTRAINT "MarkerGroupMB_drawingMbId_fkey" FOREIGN KEY ("drawingMbId") REFERENCES "Drawing_MB"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarkerGroupAB" ADD CONSTRAINT "MarkerGroupAB_drawingAbId_fkey" FOREIGN KEY ("drawingAbId") REFERENCES "Drawing_AB"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarkerGroupBoq" ADD CONSTRAINT "MarkerGroupBoq_drawingBoqId_fkey" FOREIGN KEY ("drawingBoqId") REFERENCES "Drawing_BOQ"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Kanban_Cards" ADD CONSTRAINT "Kanban_Cards_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
