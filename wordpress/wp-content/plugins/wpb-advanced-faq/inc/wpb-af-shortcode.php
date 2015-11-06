<?php

/*
	WPB Advanced FAQ
	By WPBean
	
*/


if ( !function_exists('wpb_af_shortcode_function') ){
	function wpb_af_shortcode_function ($atts) {

		extract(shortcode_atts(array(
	      'post' 			=> -1,
	      'order' 			=> 'DESC',
	      'orderby' 		=> 'date',
	      'category'		=> '',
	      'tags'			=> '',
	      'theme'			=> 'flat', // ui, 
	      'close_previous'	=> 'yes', // no
		  
	   ), $atts));
	   
		$wp_query = new WP_Query( array( 
			'post_type' 			=> 'wpb_af_faq', 
			'orderby' 				=> $orderby,
			'order' 				=> $order,
			'posts_per_page' 		=> $post,
			'wpb_af_faq_category'	=> $category,
			'wpb_af_faq_tags'		=> $tags,
		));

		$wpb_af_id = rand(10,1000);

		ob_start();

		if ($wp_query->have_posts()){ 
		?>
		<div id="wpb_af_<?php echo $wpb_af_id; ?>" class="wpb_af_<?php echo $theme; ?>_theme">
			<ul class="wpb_af_area">
				<?php while ($wp_query->have_posts()) : $wp_query->the_post();?>
					<?php $faq_content = get_the_content(); ?>
					<li id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<a href="#"><?php the_title(); ?></a>
						<?php if( $faq_content && $faq_content != '' ):?>
							<ul>
			                    <li><?php the_content(); ?></li>
			                </ul>
		            	<?php endif;?>
					</li>
			    <?php endwhile; ?>
			</ul>
		</div>

		<script type="text/javascript">
		jQuery( function($) {  
			$("#wpb_af_<?php echo $wpb_af_id; ?> > ul").navgoco({
				<?php if( $theme == 'flat' ):?>
		        caretHtml: '<i class="icon-wpb-af-plus"></i>',
		        <?php endif;?>
				accordion: <?php echo ( $close_previous == 'yes' ? 'true' : 'false' ); ?>,
				openClass: 'wpb-submenu-indicator-minus',
				save: true,
				cookie: {
					name: 'wpb_af',
					expires: false,
					path: '/'
				},
				slide: {
					duration: 400,
					easing: 'swing'
				}
		    });
		});
		</script>

		<?php
		}else{
			_e( '<h2 class="text-center">'.'No Post Found For FAQ.'.'</h2>', 'margo' );
		}
		wp_reset_postdata();  // Reset
		return ob_get_clean();
	}
	add_shortcode( 'wpb_af_faqs', 'wpb_af_shortcode_function' );
}	