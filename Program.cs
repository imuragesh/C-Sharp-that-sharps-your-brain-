using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace overLoadMethod
{


    internal class Program
    {
        public void test()
        {
            Console.WriteLine("first method");
        }
        public void test( int i)
        {
            Console.WriteLine("second method");
        }
        public void test(string s)
        {
            Console.WriteLine("third method");
        }
        public void test(int i ,string s)
        {
            Console.WriteLine("fourth method method");
        }
        public void test(string s,int i)
        {
            Console.WriteLine("fifth method");
        }


        static void Main(string[] args)
        {
            Program p = new Program();
            p.test();
            p.test(10);
            p.test("b");
            p.test(2, "hi");
            p.test("hi", 1);
           
        }
    }
}
