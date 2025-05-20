import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/custom_cached_img.dart';
import '../../data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 4,
        color: Colors.black,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: SizedBox(
            height: 120,
            child: Row(
              children: [
                CustomCachedImage(
                  img: "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        Expanded(
                          child: Text(
                            movie.overview,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                movie.releaseDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
