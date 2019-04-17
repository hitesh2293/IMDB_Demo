using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Entity.DTO;
using Entity.Models;
using Manager.IManager;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace IMDB_WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        public IUserManager _userManager;
        public IMapper _mapper;

        public UserController(IUserManager userManager, IMapper mapper)
        {
            _userManager = userManager;
            _mapper = mapper;
        }

        [HttpGet]
        public List<UserDetailsDTO> GetAllUsers()
        {
            List<UserDetails> result = _userManager.GetAllActors();
            List<UserDetailsDTO> lst = _mapper.Map<List<UserDetailsDTO>>(result);
            return lst;
        }

        [HttpGet("/api/User/GetAllProducers")]
        public List<UserDetailsDTO> GetAllProducers()
        {
            List<UserDetails> result = _userManager.GetAllProducers();
            List<UserDetailsDTO> lst = _mapper.Map<List<UserDetailsDTO>>(result);
            return lst;
        }

        [HttpGet("{id}")]
        public UserDetailsDTO GetByID([FromRoute]int id)
        {
            var result = _userManager.GetUserDetailsById(id);
            UserDetailsDTO userDetailsDTO = _mapper.Map<UserDetailsDTO>(result);
            return userDetailsDTO;
        }

        [HttpPost]
        public string Post([FromBody]UserDetailsDTO userDetailsDTO)
        {
            try
            {
                userDetailsDTO.UdDob = Convert.ToDateTime(userDetailsDTO.DateOfBirth);
            }
            catch
            {
                return "Incorrect DOB";
            }
            if (userDetailsDTO.UdName == null || userDetailsDTO.UdName == "")
                return "Please enter name";
            if (userDetailsDTO.UdSex == null || userDetailsDTO.UdSex <= 0)
                return "Please select gender";

            userDetailsDTO.UdIsDeleted = false;

            UserDetails userDetails = _mapper.Map<UserDetails>(userDetailsDTO);
            if (_userManager.CreateUser(userDetails))
                return "Data Saved";
            return "Data did not saved. Please try again.";
        }

        [HttpPut]
        public string Put(UserDetailsDTO userDetailsDTO)
        {
            try
            {
                userDetailsDTO.UdDob = Convert.ToDateTime(userDetailsDTO.DateOfBirth);
            }
            catch
            {
                return "Incorrect DOB";
            }
            if (userDetailsDTO.UdName == null || userDetailsDTO.UdName == "")
                return "Please enter name";
            if (userDetailsDTO.UdSex == null || userDetailsDTO.UdSex <= 0)
                return "Please select gender";

            userDetailsDTO.UdIsDeleted = false;

            UserDetails userDetails = _mapper.Map<UserDetails>(userDetailsDTO);
            if (_userManager.UpdateUser(userDetails))
                return "Data updated";
            return "Data did not updated. Please try again.";
        }
    }
}