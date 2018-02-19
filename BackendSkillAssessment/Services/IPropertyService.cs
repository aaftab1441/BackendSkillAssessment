using BackendSkillAssessment.Models.Property;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BackendSkillAssessment.Services
{
    public interface IPropertyService
    {
        Task AddAsync(PropertyViewModel property);
        Task<List<PropertyViewModel>> GetAllAsync();
        Task<PropertyViewModel> FindAsync(int id);
        bool PropertyExists(int id);
        Task UpdateAsync(PropertyViewModel property);
        Task<PropertyViewModel> DeleteAsync(int id);
        Task DeleteConfirmedAsync(int id);
    }
}
