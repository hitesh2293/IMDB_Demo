using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Entity.Models;
using Entity.DTO;

namespace Entity.Helpers
{
    public class AutoMapper : Profile
    {
        public AutoMapper()
        {
            CreateMap<Movies, MovieDTO>();
            CreateMap<UserDetails, UserDetailsDTO>();
            CreateMap<UserDetailsDTO, UserDetails>();
        }
    }
}
