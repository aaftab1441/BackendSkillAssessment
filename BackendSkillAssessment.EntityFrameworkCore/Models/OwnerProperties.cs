using System;
using System.Collections.Generic;

namespace BackendSkillAssessment.EntityFrameworkCore.Models
{
    public partial class OwnerProperties
    {
        public int OwnerId { get; set; }
        public int PropertyId { get; set; }

        public Owner Owner { get; set; }
        public Property Property { get; set; }
    }
}
