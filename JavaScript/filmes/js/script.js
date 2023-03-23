let page = 1;

const getMovie = async (id) => {
    fetch(`https://api.themoviedb.org/3/movie/${id}?api_key=72374b3882c99c9259d6c5c6bcac333b`)
        .then(res => res.json())
        .then(data => {
            renderMovieDetails(data)
        })
        .catch(err => console.log(err));
}

const renderMovieDetails = (movie) => {
    console.log(movie);
    document.getElementById('detalhes').style.visibility = "inherit";
    document.getElementById('detalhes').innerHTML = `
        <div class="movie_details">
            <h1>${movie.original_title}</h1>
            <p><b>Detalhes:</b> ${movie.overview}</p>
            <p><b>Nota:</b> ${movie.vote_average}</p>
            <p><b>Popularidade:</b> ${movie.popularity}</p>
            <p><b>Data lançamento:</b> ${movie.release_date}</p>
            <p><b>Liguagem Original:</b> ${movie.original_language}</p>
            <label class='btn_close' onclick="document.getElementById('detalhes').style.visibility = 'hidden'"><b>fechar</b></label> 
        </div>
    `;
}


const getMovies = async () => {
    fetch(`https://api.themoviedb.org/3/movie/popular?api_key=72374b3882c99c9259d6c5c6bcac333b&language=en-US&page=${page}`)
        .then(res => res.json())
        .then(data => {
            if (page <= data.total_pages) {
                data.results.forEach(movie => {
                    rederMovie(movie)
                });
            } else {
                console.log("No more movies");
            }
        })
        .catch(err => console.log(err));

    page += 1;
}

const rederMovie = (movie) => {
    color = "movie_vote_red"
    if (movie.vote_average >= 5 && movie.vote_average < 7)
        color = "movie_vote_yellow"
    else if (movie.vote_average >= 7)
        color = "movie_vote_green"

    let date = new Date(movie.release_date)

    document.getElementById('container').innerHTML += `
        <div class="movie" onclick="getMovie(${movie.id})">
            <img class="movie_img" src="https://image.tmdb.org/t/p/w500${movie.poster_path}" alt="">
            <div class="movie_infos">
                <p class="movie_title"> <b>${movie.original_title}</b></p>
                <p class="movie_title"> Data lançamento: ${date.getDate()}/${date.getMonth()}/${date.getFullYear()}</p>
                <p class="movie_vote ${color}"><b> ${movie.vote_average}</b></p>
                
            </div>
        </div>`;
}


window.addEventListener("scroll", function () {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const scrollHeight = document.documentElement.scrollHeight;
    const clientHeight = document.documentElement.clientHeight;

    if (scrollTop + clientHeight >= scrollHeight) {
        getMovies()
    }
});