package com.example.demo.common.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;


@Configuration
public class TilesConfig {
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		final String[] configureXmlFiles =  {
				"WEB-INF/tiles/tiles_main.xml",
				"WEB-INF/tiles/tiles_admin.xml",
				"WEB-INF/tiles/tiles_seller.xml",
				"WEB-INF/tiles/tiles_mypage.xml",
        "WEB-INF/tiles/tiles_goods.xml",
        "WEB-INF/tiles/tiles_community.xml",
        "WEB-INF/tiles/tiles_temp.xml"
				}; 
		configurer.setDefinitions(configureXmlFiles);
		return configurer;
	}
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver resolver = new TilesViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}
}
