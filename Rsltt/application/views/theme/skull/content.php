<div class="container" style="margin-top: 10px;">
	<div class="row">
		<div class="span8">
			<?php include('carousel.php'); ?>
		</div>
		<div class="span4 bloc">
			<?php include('prochainMatchDomicile.php'); ?>
		</div>
		<div class="span4 bloc">
			<?php include('sponsors.php'); ?>
		</div>
	</div>
	<div class="row">
		<div class="span4 bloc">                        
			<div class="bloc-title">Departementale 1</div>
			<div class="bloc-content">
				<table style="width: 100%;">
					<?php for ($i = 1; $i < 9; $i++) { ?>
					<tr>
						<td style="text-align: center; width: 10%;"><?php echo $i; ?></td>
						<td style="text-align: center; width: 80%;">RSLTT 1</td>
						<td style="text-align: center; width: 10%;">12</td>
					</tr>
					<?php } ?>
				</table>
			</div>
			<div class="bloc-footer"><a href="#">Accèder au detail du championnat</a></div>
		</div>
		<div class="span4 bloc">
			<div class="bloc-title">Informations</div>
			<div class="bloc-content">
				<p style="text-align: center;">
					Horaires des entrainements :<br /><br />
					Mercredi : 17h30 - 19h00<br />
					Vendredi : à partir de 20h45<br /><br />
					Licence Traditionnelle Senior : 60€<br />
					Licence Traditionnelle Jeune : 40€<br />
					Licence Promo Jeune : 20€
				</p>
			</div>
		<div class="bloc-footer">Le footer du bloc</div>
	</div>
	<div class="span4 bloc">                        
		<div class="bloc-title">Departementale 3</div>
		<div class="bloc-content">
			<table style="width: 100%; text-align: center;">
				<?php for ($i = 1; $i < 9; $i++) { ?>
				<tr>
					<td style="width: 10%;"><?php echo $i; ?></td>
					<td style="width: 75%;">RSLTT 2</td>
					<td style="width: 15%;">12 pts</td>
				</tr>
				<?php } ?>
			</table>
		</div>
		<div class="bloc-footer"><a href="#">Accèder au detail du championnat</a></div>
	</div>