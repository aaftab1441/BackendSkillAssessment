using BackendSkillAssessment.Models.Property;
using BackendSkillAssessment.EntityFrameworkCore.Models;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using System.Linq;

namespace BackendSkillAssessment.Services
{
    public class PropertyService : IPropertyService
    {
        private readonly BackendSkillAssessmentContext _context;
        private readonly IMapper _mapper;

        public PropertyService(BackendSkillAssessmentContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task AddAsync(PropertyViewModel property)
        {
            var dbProperty = _mapper.Map<PropertyViewModel, Property>(property);
            _context.Add(dbProperty);
            await _context.SaveChangesAsync();
        }

        public async Task<PropertyViewModel> DeleteAsync(int id)
        {
            var property = await _context.Property
                .SingleOrDefaultAsync(m => m.PropertyId == id);
            return _mapper.Map<Property,PropertyViewModel>(property);
        }

        public async Task DeleteConfirmedAsync(int id)
        {
            var property = await _context.Property.SingleOrDefaultAsync(m => m.PropertyId == id);
            _context.Property.Remove(property);
            await _context.SaveChangesAsync();
        }

        public async Task<PropertyViewModel> FindAsync(int id)
        {
            var property = await _context.Property
                .SingleOrDefaultAsync(m => m.PropertyId == id);
            return _mapper.Map<Property, PropertyViewModel>(property);
        }

        public async Task<List<PropertyViewModel>> GetAllAsync()
        {
            var properties = await _context.Property.ToListAsync();
            return _mapper.Map<List<Property>,List<PropertyViewModel>>(properties);
        }
        public bool PropertyExists(int id)
        {
            return _context.Property.Any(e => e.PropertyId == id);
        }

        public async Task UpdateAsync(PropertyViewModel property)
        {
            try
            {
                _context.Update(property);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }
        }
    }
}
