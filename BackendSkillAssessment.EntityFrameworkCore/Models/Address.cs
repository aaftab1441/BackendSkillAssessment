using System;
using System.Collections.Generic;

namespace BackendSkillAssessment.EntityFrameworkCore.Models
{
    public partial class Address
    {
        public int AddressId { get; set; }
        public string StreetName { get; set; }
        public string OwnerState { get; set; }
        public string OwnerCity { get; set; }
        public string Address1 { get; set; }
        public int? Zip { get; set; }
        public string MunicipalityName { get; set; }
        public string Township { get; set; }
        public string Suffix { get; set; }
        public int? OwnerId { get; set; }
        public int? PropertyId { get; set; }

        public Property Property { get; set; }
    }
}
