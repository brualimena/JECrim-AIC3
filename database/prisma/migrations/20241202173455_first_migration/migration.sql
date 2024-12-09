-- CreateTable
CREATE TABLE "Ocorrencia" (
    "ocorrencia_id" UUID NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "crime" TEXT NOT NULL,

    CONSTRAINT "Ocorrencia_pkey" PRIMARY KEY ("ocorrencia_id")
);

-- CreateTable
CREATE TABLE "Acusado" (
    "acusado_id" UUID NOT NULL,
    "ocorrencia_id" UUID NOT NULL,
    "nome" TEXT,
    "cpf" TEXT,
    "telefone" TEXT,
    "endereco" TEXT,

    CONSTRAINT "Acusado_pkey" PRIMARY KEY ("acusado_id")
);

-- CreateTable
CREATE TABLE "TermoCircunstanciado" (
    "tc_id" UUID NOT NULL,
    "ocorrencia_id" UUID NOT NULL,
    "date_created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL,

    CONSTRAINT "TermoCircunstanciado_pkey" PRIMARY KEY ("tc_id")
);

-- CreateTable
CREATE TABLE "Audiencia" (
    "audiencia_id" UUID NOT NULL,
    "tc_id" UUID NOT NULL,
    "date" TEXT NOT NULL,
    "hora" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Audiencia_pkey" PRIMARY KEY ("audiencia_id")
);

-- CreateTable
CREATE TABLE "Notificacao" (
    "notificacao_id" UUID NOT NULL,
    "audiencia_id" UUID NOT NULL,
    "type" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notificacao_pkey" PRIMARY KEY ("notificacao_id")
);

-- CreateTable
CREATE TABLE "User" (
    "user_id" UUID NOT NULL,
    "user" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "telefone" TEXT,
    "data_nascimento" TEXT,
    "nome_pai" TEXT,
    "nome_mae" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Participacao" (
    "audiencia_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,

    CONSTRAINT "Participacao_pkey" PRIMARY KEY ("audiencia_id","user_id")
);

-- CreateTable
CREATE TABLE "_vitima" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "TermoCircunstanciado_ocorrencia_id_key" ON "TermoCircunstanciado"("ocorrencia_id");

-- CreateIndex
CREATE UNIQUE INDEX "Audiencia_tc_id_key" ON "Audiencia"("tc_id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_cpf_key" ON "User"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "_vitima_AB_unique" ON "_vitima"("A", "B");

-- CreateIndex
CREATE INDEX "_vitima_B_index" ON "_vitima"("B");

-- AddForeignKey
ALTER TABLE "Acusado" ADD CONSTRAINT "Acusado_ocorrencia_id_fkey" FOREIGN KEY ("ocorrencia_id") REFERENCES "Ocorrencia"("ocorrencia_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TermoCircunstanciado" ADD CONSTRAINT "TermoCircunstanciado_ocorrencia_id_fkey" FOREIGN KEY ("ocorrencia_id") REFERENCES "Ocorrencia"("ocorrencia_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Audiencia" ADD CONSTRAINT "Audiencia_tc_id_fkey" FOREIGN KEY ("tc_id") REFERENCES "TermoCircunstanciado"("tc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notificacao" ADD CONSTRAINT "Notificacao_audiencia_id_fkey" FOREIGN KEY ("audiencia_id") REFERENCES "Audiencia"("audiencia_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Participacao" ADD CONSTRAINT "Participacao_audiencia_id_fkey" FOREIGN KEY ("audiencia_id") REFERENCES "Audiencia"("audiencia_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Participacao" ADD CONSTRAINT "Participacao_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_vitima" ADD CONSTRAINT "_vitima_A_fkey" FOREIGN KEY ("A") REFERENCES "Ocorrencia"("ocorrencia_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_vitima" ADD CONSTRAINT "_vitima_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
