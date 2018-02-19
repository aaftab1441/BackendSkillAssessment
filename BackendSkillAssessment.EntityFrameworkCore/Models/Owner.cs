using System;
using System.Collections.Generic;

namespace BackendSkillAssessment.EntityFrameworkCore.Models
{
    public partial class Owner
    {
        public Owner()
        {
            OwnerProperties = new HashSet<OwnerProperties>();
        }

        public int OwnerId { get; set; }
        public string OwnerName { get; set; }
        public string OwnerUnparsedName1 { get; set; }
        public string OwnerUnparsedName2 { get; set; }
        public string OwnerMatchCode { get; set; }
        public bool? OwnerMailOptOut { get; set; }
        public string OwnerName2 { get; set; }
        public string AbsenteeOwnerCode { get; set; }
        public bool? CorporateOwner { get; set; }
        public string OwnerCarrierRoute { get; set; }
        public bool? OwnerPhoneOptOut { get; set; }
        public string OwnerSuite { get; set; }

        public ICollection<OwnerProperties> OwnerProperties { get; set; }
    }
}
