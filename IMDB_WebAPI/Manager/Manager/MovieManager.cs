using System;
using System.Collections.Generic;
using System.Text;
using Entity.Models;
using Manager.IManager;
using System.Linq;
using Entity.DTO;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace Manager.Manager
{
    public class MovieManager : IMovieManage
    {
        public IContext _context;

        public MovieManager(IContext context)
        {
            _context = context;
        }

        Boolean IMovieManage.CreateMovie(Movies movie)
        {
            movie.MIsDeleted = false;
            _context.Movies.Add(movie);

            if (_context.SaveChanges() > 0)
                return true;
            return false;
        }

        Boolean IMovieManage.UpdateMovie(Movies movie)
        {
            var currentMovie = _context.Movies.Where(cond => cond.MId == movie.MId && !cond.MIsDeleted.Value).FirstOrDefault();

            List<Int32> lstNewUserList = movie.MovieAssignement.Select(sel => sel.MaUserId.Value).Distinct().ToList();

            if (currentMovie != null)
            {
                currentMovie.MName = movie.MName;
                currentMovie.MPlot = movie.MPlot;
                currentMovie.MPoster = movie.MPoster;
                currentMovie.MYearOfRelease = movie.MYearOfRelease;

                if(currentMovie.MovieAssignement != null)
                {
                    List<Int32> lstToRemove = currentMovie.MovieAssignement.Where(cond => !lstNewUserList.Contains(cond.MaUserId.Value)).Select(sel => sel.MaId).ToList();
                    List<Int32> lstCommonUserId = currentMovie.MovieAssignement.Where(cond => lstNewUserList.Contains(cond.MaUserId.Value)).Select(sel => sel.MaUserId.Value).ToList();

                    foreach(var movieAssign in movie.MovieAssignement.Where(cond=> !lstCommonUserId.Contains(cond.MaUserId.Value)).ToList())
                    {
                        MovieAssignement movieAssignement = new MovieAssignement();
                        movieAssignement.MaUserId = movieAssign.MaUserId;

                        currentMovie.MovieAssignement.Add(movieAssignement);
                    }

                    if(lstToRemove.Count > 0)
                    {
                        List<MovieAssignement> lstMAToRemove = _context.MovieAssignement.Where(cond => lstToRemove.Contains(cond.MaId)).ToList();

                        _context.MovieAssignement.RemoveRange(lstMAToRemove);
                    }
                }
            }

            if (_context.SaveChanges() > 0)
                return true;
            return false;
        }

        Boolean IMovieManage.RemoveMovie(int movieId)
        {
            var movie = _context.Movies.Where(cond => cond.MId == movieId && !cond.MIsDeleted.Value).FirstOrDefault();
            if (movie != null)
                movie.MIsDeleted = true;

            if (_context.SaveChanges() > 0)
                return true;
            return false;
        }

        Movies IMovieManage.GetMovieDetailsByID(int movieId)
        {
            return _context.Movies.Where(cond => cond.MId == movieId && !cond.MIsDeleted.Value).FirstOrDefault();
        }

        List<MovieDTO> IMovieManage.GetAllMovies()
        {
            var result = _context.Query<MovieDTO>().FromSql(@"usp_GetMovieData").ToList();
            return result;
            //return _context.Movies.Where(cond => !cond.MIsDeleted.Value).ToList();
        }
    }
}
