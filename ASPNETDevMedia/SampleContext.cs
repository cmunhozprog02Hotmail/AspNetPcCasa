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
            IQueryable<Pessoa> iqPessoa = GetPessoas().AsQueryable<Pessoa>();
            if (search != null)
                iqPessoa = iqPessoa.Where(p => p.nome.Contains(search));

            return iqPessoa;

        }
        public void AddPessoa(Pessoa p)
        {
            sdc.Pessoas.InsertOnSubmit(p);
            sdc.SubmitChanges();
            sdc.Refresh(RefreshMode.OverwriteCurrentValues, sdc.Pessoas);
            
        }
        public void DeletePessoa(int idPessoa)
        {
            Pessoa p = sdc.Pessoas.SingleOrDefault(q => q.idPessoa.Equals(idPessoa));
            sdc.Pessoas.DeleteOnSubmit(p);
            sdc.SubmitChanges();
        }
        public Pessoa GetPessoa(int idPessoa)
        {
            Pessoa p = sdc.Pessoas.SingleOrDefault(q => q.idPessoa.Equals(idPessoa));
            return p;
        }
        public void Update(Pessoa p)
        {
            Pessoa context = sdc.Pessoas.SingleOrDefault(q => q.idPessoa.Equals(p.idPessoa));
            context.nome = p.nome;
            context.telefone = p.telefone;
            context.obs = p.obs;
            sdc.SubmitChanges();
        }
    }
}