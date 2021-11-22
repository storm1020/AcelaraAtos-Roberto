﻿using System;

namespace OutroProjeto
{

    class Pessoa
    {
        private string nome;
        private string cpf;
        private string telefone;
        private string endereco;

        public string Nome { get => nome; set => nome = value; }
        public string Cpf { get => cpf; set => cpf = value; }
        public string Telefone { get => telefone; set => telefone = value; }


        public void Exibir() //Este é o metodo genérico
        {
            Console.WriteLine($"{Nome} {Cpf} {Telefone}");
        }
    }

    class Aluno : Pessoa
    {
        private string[] disiciplinasCursadas;

        public string[] DisiciplinasCursadas { get => disiciplinasCursadas; set => disiciplinasCursadas = value; }

        public void Exibir()
        {
            Console.Write("ALUNO: ");
            base.Exibir();
        }
    }

    class Instrutor : Pessoa
    {
        private string[] disciplinasMinistradas;

        public string[] DisciplinasMinistradas { get => disciplinasMinistradas; set => disciplinasMinistradas = value; }

        public void Exibir()
        {
            Console.Write("INSTRUTOR: ");
            base.Exibir();
        }

    }


    internal class Program
    {

        static void Main(string[] args)
        {
            Aluno alu = new Aluno();
            alu.Nome = "Antonio Fagundes";
            alu.Cpf = "000.000.001-91";
            alu.Telefone = "(35) 99998-9899";
            alu.DisiciplinasCursadas = new string[] { "DotNet", "Java", "SQL", "GIT" };
            alu.Exibir();

            Instrutor instrutor = new Instrutor();
            instrutor.Nome = "Antonio Fagundes";
            instrutor.Cpf = "000.000.001-91";
            instrutor.Telefone = "(35) 99998-9899";
            instrutor.DisciplinasMinistradas = new string[] { "DotNet", "Entity Framework", "Xamarin" };
            instrutor.Exibir();

            Console.WriteLine("Hello World!");
        }
    }
}
