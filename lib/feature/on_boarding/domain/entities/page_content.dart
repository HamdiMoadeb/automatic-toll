
import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/res/media_res.dart';

class PageContent extends Equatable {

  final String image;
  final String title;
  final String description;

  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
    image: MediaRes.payToll,
    title: 'Payer les péages',
    description:
    'Payez les péages en conduisant avec le mode de paiement sélectionné',
  );

  const PageContent.second()
      : this(
    image: MediaRes.tollAlert,
    title: 'Alerte péage',
    description:
    'Recevez des notifications avec le coût estimé du péage à chaque fois que vous passez un point de péage',
  );

  const PageContent.third()
      : this(
    image: MediaRes.tollTrip,
    title: 'Calculateur de trajet',
    description:
    'Trouvez l\'itinéraire le moins cher et le plus rapide vers votre destination et estimez les coûts de péage pour un voyage',
  );


  @override
  List<Object> get props => [image, title, description];
}