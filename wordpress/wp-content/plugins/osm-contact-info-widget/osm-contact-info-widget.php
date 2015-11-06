<?php defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

/*
Plugin Name: OSM Contact Info Widget
Plugin URI:  http://www.desarrollowp.com
Description: This plugin allows you to create a contact info card in a widget. You can add your contact information in plain text, hCard format or fontAwesome icons...
Version:     1.0
Author:      Pablo López
Author URI:  http://www.desarrollowp.com
License:     GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
Domain Path: /languages
Text Domain: osm-contact-info-widget
*/

class OSM_Contact_Info_Widget extends WP_Widget {
    /**
     * Sets up the widgets name etc
     */
    public function __construct() {
        $widget_ops = array('classname' => 'osm-contact-info-widget', 'description' => __( 'Add contact to your widgets', 'osm-contact-info-widget' ) );
        parent::__construct('osm_contact_info_widget', __( 'OSM Contact Info Widget', 'osm-contact-info-widget'), $widget_ops);

        if ( is_active_widget( false, false, $this->id_base ) ) {
            add_action('wp_enqueue_scripts','osm_contact_info_widget_fa');
        }
    }

    /**
     * Outputs the content of the widget
     *
     * @param array $args
     * @param array $instance
     */
    public function widget( $args, $instance ) {
        $title = apply_filters( 'widget_title', empty( $instance['title'] ) ? '' : $instance['title'], $instance );
        $company = esc_attr($instance['company']);
        $address = esc_attr($instance['address']);
        $postal_code = esc_attr($instance['postal_code']);
        $city = esc_attr($instance['city']);
        $province = esc_attr($instance['province']);
        $country = esc_attr($instance['country']);
        $email = esc_attr($instance['email']);
        $phone1 = esc_attr($instance['phone1']);
        $phone2 = esc_attr($instance['phone2']);
        $fax = esc_attr($instance['fax']);
        $text = apply_filters( 'widget_text', empty( $instance['text'] ) ? '' : $instance['text'], $instance );
        $format = esc_attr($instance['format']);

        echo $args['before_widget'];
        if ( $title ) {
            echo $args['before_title'] . $title . $args['after_title'];
        }
        echo '<div id="osm-contact-info-widget-wrapper">';
            switch ($format) {
                case 2: //hCard
                    echo '<div id="hcard-' . $company . '" class="vcard">' . "\n";
                        echo '<div class="fn org">' . $company . '</div>' . "\n";
                        echo '<div class="adr">' . "\n";
                            echo '<span class="street-address">' . $address . '</span><br />' . "\n";
                            if ($postal_code) { echo '<span class="postal-code">' . $postal_code . '</span>';}
                            if ($city) { echo ' <span class="locality">' . $city . '</span>,';}
                            if ($province) { echo ' <span class="region">' . $province . '</span>';}
                            if ($country) { echo ' (<span class="country-name">' . $country . '</span>)';}
                        echo '</div>' . "\n";

                        if ($email) {
                            echo '<a href="mailto:' . $email . '" class="email">' . $email . '</a>' . "\n";
                        }
                        if ($phone1) {
                            echo '<div class="tel">' . "\n";
                                echo '<span class="type">work</span>: <span class="value">' . $phone1 . '</span>' . "\n";
                            echo '</div>' . "\n";
                        }
                        if ($phone2) {
                            echo '<div class="tel">' . "\n";
                                echo '<span class="type">work</span>: <span class="value">' . $phone2 . '</span>' . "\n";
                            echo '</div>' . "\n";
                        }
                        if ($fax) {
                            echo '<div class="tel">' . "\n";
                                echo '<span class="type">fax</span>: <span class="value">' . $fax . '</span>' . "\n";
                            echo '</div>' . "\n";
                        }
                    echo '</div><!-- vcard -->' . "\n";
                    if ($text) {
                        echo '<p>' . $text . '</p>' . "\n";
                    }
                    break;

                case 3: //FontAwesome
                    echo '<div class="contactinfo-company"><i class="fa fa-list"></i> ' . $company . '</div>' . "\n";
                    echo '<div class="contactinfo-address"><i class="fa fa-map-marker"></i> ' . "\n";
                        echo $address . '<br />' . "\n";
                        echo $postal_code . " " . $city;
                        if ($province) { echo ', ' . $province;}
                        if ($country) { echo ' (' . $country . ')';}
                    echo '</div><!-- contactinfo-address -->' . "\n";

                    if ($phone1 || $phone2 || $fax) {
                        echo '<div class="contactinfo-phones">' . "\n";
                            if ($phone1) { echo '<i class="fa fa-phone"></i> ' . $phone1 . "<br />\n";}
                            if ($phone2) { echo '<i class="fa fa-phone"></i> ' . $phone2 . "<br />\n";}
                            if ($fax) { echo '<i class="fa fa-fax"></i> ' . $fax . "<br />\n";}
                        echo '</div><!-- contactinfo-phones -->' . "\n";
                    }
                    if ($email) {
                        echo '<div class="contactinfo-email">' . "\n";
                            echo '<i class="fa fa-envelope"></i> <a href="mailto:' . $email . '">' . $email . '</a>' . "\n";
                        echo '</div><!-- contactinfo-email -->' . "\n";
                    }
                    if ($text) {
                        echo '<p class="contactinfo-text">' . $text . '</p>' . "\n";
                    }
                    break;
                
                default: //Plain Text
                    echo '<div class="contactinfo-company">' . $company . '</div>' . "\n";
                    echo '<div class="contactinfo-address">' . "\n";
                        echo $address . '<br />' . "\n";
                        echo $postal_code . " " . $city;
                        if ($province) { echo ', ' . $province;}
                        if ($country) { echo ' (' . $country . ')';}
                    echo '</div><!-- contactinfo-address -->' . "\n";

                    if ($phone1 || $phone2 || $fax) {
                        echo '<div class="contactinfo-phones">' . "\n";
                            if ($phone1) { echo __('Phone 1','osm-contact-info-widget') . ': ' . $phone1 . "<br />\n";}
                            if ($phone2) { echo __('Phone 2','osm-contact-info-widget') . ': ' . $phone2 . "<br />\n";}
                            if ($fax) { echo __('Fax','osm-contact-info-widget') . ': ' . $fax . "<br />\n";}
                        echo '</div><!-- contactinfo-phones -->' . "\n";
                    }
                    if ($email) {
                        echo '<div class="contactinfo-email">' . "\n";
                            echo __('E-mail','osm-contact-info-widget') . ': <a href="mailto:' . $email . '" class="email">' . $email . '</a>' . "\n";
                        echo '</div><!-- contactinfo-email -->' . "\n";
                    }
                    if ($text) {
                        echo '<p class="contactinfo-text">' . $text . '</p>' . "\n";
                    }
                    break;
            }

        echo '</div><!-- osm-contact-info-widget-wrapper -->';
        echo $args['after_widget'];
    }

    /**
     * Outputs the options form on admin
     *
     * @param array $instance The widget options
     */
    public function form( $instance ) {
        // outputs the options form on admin
        $instance = wp_parse_args( (array) $instance, array( 'title' => '' ) );
        $title = strip_tags($instance['title']);
        $company = strip_tags($instance['company']);
        $address = strip_tags($instance['address']);
        $postal_code = strip_tags($instance['postal_code']);
        $city = strip_tags($instance['city']);
        $province = strip_tags($instance['province']);
        $country = strip_tags($instance['country']);
        $email = strip_tags($instance['email']);
        $phone1 = strip_tags($instance['phone1']);
        $phone2 = strip_tags($instance['phone2']);
        $fax = strip_tags($instance['fax']);
        $text = strip_tags($instance['text']);
        $format = strip_tags($instance['format']);?>

        <p>
            <label for="<?php echo $this->get_field_id('title');?>"><?php _e('Title','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('title');?>" name="<?php echo $this->get_field_name('title');?>" class="widefat" value="<?php echo esc_attr($title);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('company');?>"><?php _e('Company Name','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('company');?>" name="<?php echo $this->get_field_name('company');?>" class="widefat" value="<?php echo esc_attr($company);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('address');?>"><?php _e('Address','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('address');?>" name="<?php echo $this->get_field_name('address');?>" class="widefat" value="<?php echo esc_attr($address);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('postal_code');?>"><?php _e('Postal Code','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('postal_code');?>" name="<?php echo $this->get_field_name('postal_code');?>" class="widefat" value="<?php echo esc_attr($postal_code);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('city');?>"><?php _e('City','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('city');?>" name="<?php echo $this->get_field_name('city');?>" class="widefat" value="<?php echo esc_attr($city);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('province');?>"><?php _e('Province','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('province');?>" name="<?php echo $this->get_field_name('province');?>" class="widefat" value="<?php echo esc_attr($province);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('country');?>"><?php _e('Country','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('country');?>" name="<?php echo $this->get_field_name('country');?>" class="widefat" value="<?php echo esc_attr($country);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('email');?>"><?php _e('E-mail','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('email');?>" name="<?php echo $this->get_field_name('email');?>" class="widefat" value="<?php echo esc_attr($email);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('phone1');?>"><?php _e('Phone 1','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('phone1');?>" name="<?php echo $this->get_field_name('phone1');?>" class="widefat" value="<?php echo esc_attr($phone1);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('phone2');?>"><?php _e('Phone 2','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('phone2');?>" name="<?php echo $this->get_field_name('phone2');?>" class="widefat" value="<?php echo esc_attr($phone2);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('fax');?>"><?php _e('Fax','osm-contact-info-widget');?>:</label>
            <input type="text" id="<?php echo $this->get_field_id('fax');?>" name="<?php echo $this->get_field_name('fax');?>" class="widefat" value="<?php echo esc_attr($fax);?>" />
        </p>

        <p>
            <label for="<?php echo $this->get_field_id('text');?>"><?php _e('Text','osm-contact-info-widget');?>:</label>
            <textarea id="<?php echo $this->get_field_id('text');?>" name="<?php echo $this->get_field_name('text');?>" rows="4" class="widefat"><?php echo esc_attr($text);?></textarea>
        </p>

        <p>
            <input type="radio" id="<?php echo $this->get_field_id('format');?>" name="<?php echo $this->get_field_name('format');?>" value="1" class="checkbox" <?php if (esc_attr($format) == 1) {?>checked<?php }?> /> <?php _e('Plain Text','osm-contact-info-widget');?><br>
            <input type="radio" id="<?php echo $this->get_field_id('format');?>" name="<?php echo $this->get_field_name('format');?>" value="2" class="checkbox" <?php if (esc_attr($format) == 2) {?>checked<?php }?> /> <?php _e('hCard','osm-contact-info-widget');?><br>
            <input type="radio" id="<?php echo $this->get_field_id('format');?>" name="<?php echo $this->get_field_name('format');?>" value="3" class="checkbox" <?php if (esc_attr($format) == 3) {?>checked<?php }?> /> <?php _e('FontAwesome','osm-contact-info-widget');?>
        </p>
    <?php }

    /**
     * Processing widget options on save
     *
     * @param array $new_instance The new options
     * @param array $old_instance The previous options
     */
    public function update( $new_instance, $old_instance ) {
        // processes widget options to be saved
        $instance = $old_instance;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['company'] = strip_tags($new_instance['company']);
        $instance['address'] = strip_tags($new_instance['address']);
        $instance['postal_code'] = strip_tags($new_instance['postal_code']);
        $instance['city'] = strip_tags($new_instance['city']);
        $instance['province'] = strip_tags($new_instance['province']);
        $instance['country'] = strip_tags($new_instance['country']);
        $instance['email'] = strip_tags($new_instance['email']);
        $instance['phone1'] = strip_tags($new_instance['phone1']);
        $instance['phone2'] = strip_tags($new_instance['phone2']);
        $instance['fax'] = strip_tags($new_instance['fax']);
        $instance['text'] = strip_tags($new_instance['text']);
        $instance['format'] = strip_tags($new_instance['format']);

        return $instance;
    }
}

//Add Donate Link for the plugin on the WP plugin configuration page
function osm_contact_info_widget_donate($links, $file) {
    if($file == plugin_basename(__FILE__)) {
        $links[] = '<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=6JYWV644JYL7Q&lc=ES&item_name=OSM" target="_blank">' . __('Donate', 'osm-contact-info-widget') . '</a>';
    }
    return $links;
}
add_filter('plugin_row_meta', 'osm_contact_info_widget_donate', 10, 2);

function osm_contact_info_widget_fa(){
    wp_enqueue_style('font-awesome', plugin_dir_url(__FILE__) . '/css/font-awesome.min.css');
}

// Widget Init
function osm_contact_info_widget_init() {
    register_widget('OSM_Contact_Info_Widget');
}
add_action('widgets_init', 'osm_contact_info_widget_init');

// Widget i18n
load_plugin_textdomain( 'osm-contact-info-widget', false, dirname( plugin_basename( __FILE__ ) ) . '/languages' );?>