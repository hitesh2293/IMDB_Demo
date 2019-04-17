using Entity.DTO;
using Entity.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Manager.IManager
{
    public interface IMovieManage
    {
        Boolean CreateMovie(Movies movie);
        Boolean UpdateMovie(Movies movie);
        Boolean RemoveMovie(int movieId);
        Movies GetMovieDetailsByID(int movieId);
        List<MovieDTO> GetAllMovies();
    }
}
