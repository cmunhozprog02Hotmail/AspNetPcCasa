using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace ASPNETDevMedia
{
    public class SampleContext
    {
        SampleDataContext sdc = new SampleDataContext();

        public Table<Pessoa> GetPessoas()
        {
            return sdc.Pessoas;
        }

        public IQueryable<Pessoa> GetPessoas(string search)
        {
            return GetPessoas().Where(p => p.nome.Contains(search));
        }
    }
}