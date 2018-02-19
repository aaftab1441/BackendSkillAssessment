using AutoMapper;
using BackendSkillAssessment.EntityFrameworkCore.Models;
using BackendSkillAssessment.Models.Property;

namespace BackendSkillAssessment.AutoMapper
{
    public class DomainProfile : Profile
    {
        public DomainProfile()
        {
            CreateMap<Property, PropertyViewModel>();
            CreateMap<PropertyViewModel, Property>();
        }
    }
}
