using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Entity.DTO;
using Entity.Models;
using Manager.IManager;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace IMDB_WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        public IMovieManage _movieManager;
        public IMapper _mapper;

        public MovieController(IMovieManage movieManage, IMapper mapper)
        {
            _movieManager = movieManage;
            _mapper = mapper;
        }

        [HttpPost]
        public string Post([FromBody]MovieDTO movieDTO)
        {
            if (movieDTO.MId > 0)
                return "Movie ID can not present while creation of new movie entry";

            if (movieDTO.MName == null || movieDTO.MName == "")
                return "Please enter movie name";

            if (movieDTO.MName == null || movieDTO.MName == "")
                return "Please enter movie name";
            if (movieDTO.MYearOfRelease == null || movieDTO.MYearOfRelease == "")
                return "Please enter year of release";
            if (movieDTO.MPlot == null || movieDTO.MPlot == "")
                return "Please enter plot";
            if (movieDTO.MPoster == null || movieDTO.MPoster == "")
                return "Please select poster of movie";

            if (movieDTO.ProducerId <= 0)
                return "Please select producer of movie";

            if (movieDTO.LstActorIds.Count <= 0)
                return "Please select alteast one actor for movie";

            Movies movies = _mapper.Map<Movies>(movieDTO);

            List<MovieAssignement> lstMovieAssignements = new List<MovieAssignement>();
            MovieAssignement movieAssignement = new MovieAssignement();
            movieAssignement.MaUserId = movieDTO.ProducerId;
            lstMovieAssignements.Add(movieAssignement);
            movieDTO.LstActorIds.ForEach(Actor =>
            {
                movieAssignement = new MovieAssignement();
                movieAssignement.MaUserId = Actor;
                lstMovieAssignements.Add(movieAssignement);
            });
            movies.MovieAssignement = lstMovieAssignements;

            if (_movieManager.CreateMovie(movies))
                return "Data updated";
            return "Data did not updated. Please try again.";

        }

        [HttpPut]
        public String Put([FromBody]MovieDTO movieDTO)
        {
            if (movieDTO.MId <= 0)
                return "Movie ID does not present";

            if (movieDTO.MName == null || movieDTO.MName == "")
                return "Please enter movie name";

            if (movieDTO.MName == null || movieDTO.MName == "")
                return "Please enter movie name";
            if (movieDTO.MYearOfRelease == null || movieDTO.MYearOfRelease == "")
                return "Please enter year of release";
            if (movieDTO.MPlot == null || movieDTO.MPlot == "")
                return "Please enter plot";
            if (movieDTO.MPoster == null || movieDTO.MPoster == "")
                return "Please select poster of movie";

            if (movieDTO.ProducerId <= 0)
                return "Please select producer of movie";

            if (movieDTO.LstActorIds.Count <= 0)
                return "Please select alteast one actor for movie";

            Movies movies = _mapper.Map<Movies>(movieDTO);

            List<MovieAssignement> lstMovieAssignements = new List<MovieAssignement>();
            MovieAssignement movieAssignement = new MovieAssignement();
            movieAssignement.MaUserId = movieDTO.ProducerId;
            lstMovieAssignements.Add(movieAssignement);
            movieDTO.LstActorIds.ForEach(Actor =>
            {
                movieAssignement = new MovieAssignement();
                movieAssignement.MaUserId = Actor;
                lstMovieAssignements.Add(movieAssignement);
            });
            movies.MovieAssignement = lstMovieAssignements;

            if (_movieManager.UpdateMovie(movies))
                return "Data updated";
            return "Data did not updated. Please try again.";
        }

        [HttpDelete("{Id}")]
        public bool Delete([FromRoute]int Id)
        {
            if (Id <= 0)
                throw new Exception("Movie ID does not present");

            return _movieManager.RemoveMovie(Id);

        }

        [HttpGet]
        public List<MovieDTO> Get()
        {
            return _movieManager.GetAllMovies();
        }

        [HttpGet("GetMovieByID/{Id}")]
        public Movies GetMovieByID([FromRoute]int Id)
        {
            return _movieManager.GetMovieDetailsByID(Id);
        }
    }
}