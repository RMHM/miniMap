package com.kh.mhm.api.common;

public class ConvLonLatToXY {
	
	public int[] ll_to_ij(double lat, double lon) {

		double map_proj, truelat1, truelat2, stand_lon, ref_lat, ref_lon, pole_lat, pole_lon, knowni, knownj, dx, dy,
				latinc, loninc;

		map_proj = 1;

		truelat1 = 30.d;

		truelat2 = 60.d;

		stand_lon = 126.d;

		ref_lat = 32.25687d;

		ref_lon = 121.8344d;

		knowni = 0;

		knownj = 0;

		dx = 1.5d * 1000d;

		dy = 1.5d * 1000d;

		pole_lat = 90.0;

		pole_lon = 0.0;

		latinc = 0.0;

		loninc = 0.0;

		latinc = (dy * 360.D) / 2.0D / 3.141592653589793D / 6370000.D;

		loninc = (dx * 360.D) / 2.0D / 3.141592653589793D / 6370000.D;

		int[] xy = new int[2];

		if (lon < -180 || lon > 180) {

			xy[0] = -1;

			xy[1] = 0;

			return xy;

		}

		if (lat < -90 || lat > 90) {

			xy[0] = 0;

			xy[1] = -1;

			return xy;

		}

		double[] xy1 = wrf_user_ll_to_ij(map_proj, truelat1, truelat2, stand_lon, ref_lat, ref_lon, pole_lat, pole_lon,
				knowni, knownj, dx, dy, latinc, loninc, lat, lon);

		xy[0] = (int) Math.round(xy1[0] - 259.99306118792407d); // X

		xy[1] = (int) Math.round(xy1[1] - 52.998455308070334d); // Y

		return xy;

	}

// Converts input lat/lon values to the cartesian (i,j) value

// for the given projection.

	public double[] wrf_user_ll_to_ij(double MAP_PROJ, double TRUELAT1, double TRUELAT2, double STDLON, double LAT1,
			double LON1, double POLE_LAT, double POLE_LON, double KNOWNI, double KNOWNJ, double DX, double DY, double LATINC,
			double LONINC, double LAT, double LON) {

		double DELTALON1;

		double TL1R;

		double CLAIN, DLON, RSW, DELTALON, DELTALAT;

		double REFLON, SCALE_TOP, ALA1, ALO1, ALA, ALO, RM, POLEI, POLEJ;

		// Earth radius divided by dx

		double REBYDX;

		double DELTALON1TL1R, CTL1R, ARG, CONE, HEMI;

		double I, J;

		double LAT1N, LON1N, OLAT, OLON;

		double PI, RAD_PER_DEG, DEG_PER_RAD, RE_M;

		/*
		 * 
		 * ccc lat1 ! SW latitude (1,1) in degrees (-90->90N)
		 * 
		 * ccc lon1 ! SW longitude (1,1) in degrees (-180->180E)
		 * 
		 * ccc dx ! Grid spacing in meters at truelats
		 * 
		 * ccc dlat ! Lat increment for lat/lon grids
		 * 
		 * ccc dlon ! Lon increment for lat/lon grids
		 * 
		 * ccc stdlon ! Longitude parallel to y-axis (-180->180E)
		 * 
		 * ccc truelat1 ! First true latitude (all projections)
		 * 
		 * ccc truelat2 ! Second true lat (LC only)
		 * 
		 * ccc hemi ! 1 for NH, -1 for SH
		 * 
		 * ccc cone ! Cone factor for LC projections
		 * 
		 * ccc polei ! Computed i-location of pole point
		 * 
		 * ccc polej ! Computed j-location of pole point
		 * 
		 * ccc rsw ! Computed radius to SW corner
		 * 
		 * ccc knowni ! X-location of known lat/lon
		 * 
		 * ccc knownj ! Y-location of known lat/lon
		 * 
		 * ccc RE_M ! Radius of spherical earth, meters
		 * 
		 * ccc REbydx ! Earth radius divided by dx
		 * 
		 */

		PI = 3.141592653589793D;

		RAD_PER_DEG = PI / 180.D;

		DEG_PER_RAD = 180.D / PI;

		RE_M = 6370000.D;

		RE_M = 6371008.77D;

		REBYDX = RE_M / DX;

		I = 0;

		J = 0;

		/*
		 * KNOWNI = 1.0;
		 * 
		 * KNOWNJ = 1.0;
		 */

		HEMI = 1.0D;

		if (TRUELAT1 < 0.0D) {

			HEMI = -1.0D;

		}

		// MERCATOR

		if (MAP_PROJ == 3) {

			CLAIN = Math.cos(RAD_PER_DEG * TRUELAT1);

			DLON = DX / (RE_M * CLAIN);

			// Compute distance from equator to origin, and store in

			// the rsw tag.

			RSW = 0.D;

			if (LAT1 != 0.D) {

				RSW = (Math.log(Math.tan(0.5D * ((LAT1 + 90.D) * RAD_PER_DEG)))) / DLON;

			}

			DELTALON = LON - LON1;

			if (DELTALON < -180.D)
				DELTALON = DELTALON + 360.D;

			if (DELTALON > 180.D)
				DELTALON = DELTALON - 360.D;

			I = KNOWNI + (DELTALON / (DLON * DEG_PER_RAD));

			J = KNOWNJ + (Math.log(Math.tan(0.5D * ((LAT + 90.D) * RAD_PER_DEG)))) / DLON - RSW;

			// PS

		} else if (MAP_PROJ == 2) {

			REFLON = STDLON + 90.D;

			// Compute numerator term of map scale factor

			SCALE_TOP = 1.D + HEMI * Math.sin(TRUELAT1 * RAD_PER_DEG);

			// Compute radius to lower-left (SW) corner

			ALA1 = LAT1 * RAD_PER_DEG;

			RSW = REBYDX * Math.cos(ALA1) * SCALE_TOP / (1.D + HEMI * Math.sin(ALA1));

			// Find the pole point

			ALO1 = (LON1 - REFLON) * RAD_PER_DEG;

			POLEI = KNOWNI - RSW * Math.cos(ALO1);

			POLEJ = KNOWNJ - HEMI * RSW * Math.sin(ALO1);

			// Find radius to desired point

			ALA = LAT * RAD_PER_DEG;

			RM = REBYDX * Math.cos(ALA) * SCALE_TOP / (1.D + HEMI * Math.sin(ALA));

			ALO = (LON - REFLON) * RAD_PER_DEG;

			I = POLEI + RM * Math.cos(ALO);

			J = POLEJ + HEMI * RM * Math.sin(ALO);

		} else if (MAP_PROJ == 1) {

			if (Math.abs(TRUELAT2) > 90.D) {

				TRUELAT2 = TRUELAT1;

			}

			if (Math.abs(TRUELAT1 - TRUELAT2) > 0.1D) {

				CONE = (Math.log(Math.cos(TRUELAT1 * RAD_PER_DEG)) - Math.log(Math.cos(TRUELAT2 * RAD_PER_DEG))) /

						(Math.log(Math.tan((90.D - Math.abs(TRUELAT1)) * RAD_PER_DEG * 0.5D))

								- Math.log(Math.tan((90.D - Math.abs(TRUELAT2)) * RAD_PER_DEG * 0.5D)));

			} else {

				CONE = Math.sin(Math.abs(TRUELAT1) * RAD_PER_DEG);

			}

			// Compute longitude differences and ensure we stay

			// out of the forbidden "cut zone"

			DELTALON1 = LON1 - STDLON;

			if (DELTALON1 > +180.D)
				DELTALON1 = DELTALON1 - 360.D;

			if (DELTALON1 < -180.D)
				DELTALON1 = DELTALON1 + 360.D;

			// Convert truelat1 to radian and compute COS for later use

			TL1R = TRUELAT1 * RAD_PER_DEG;

			CTL1R = Math.cos(TL1R);

			// Compute the radius to our known lower-left (SW) corner

			RSW = REBYDX * CTL1R / CONE *

					Math.pow((Math.tan((90.D * HEMI - LAT1) * RAD_PER_DEG / 2.D)
							/ Math.tan((90.D * HEMI - TRUELAT1) * RAD_PER_DEG / 2.D)), CONE);

			// Find pole point

			ARG = CONE * (DELTALON1 * RAD_PER_DEG);

			POLEI = HEMI * KNOWNI - HEMI * RSW * Math.sin(ARG);

			POLEJ = HEMI * KNOWNJ + RSW * Math.cos(ARG);

			DELTALON = LON - STDLON;

			if (DELTALON > +180.D)
				DELTALON = DELTALON - 360.D;

			if (DELTALON < -180.D)
				DELTALON = DELTALON + 360.D;

			RM = REBYDX * CTL1R / CONE * Math.pow((Math.tan((90.D * HEMI - LAT) * RAD_PER_DEG / 2.D)
					/ Math.tan((90.D * HEMI - TRUELAT1) * RAD_PER_DEG / 2.D)), CONE);

			ARG = CONE * (DELTALON * RAD_PER_DEG);

			I = POLEI + HEMI * RM * Math.sin(ARG);

			J = POLEJ - RM * Math.cos(ARG);

			/*
			 * 
			 * Finally, if we are in the southern hemisphere, flip the
			 * 
			 * i/j values to a coordinate system where (1,1) is the SW
			 * 
			 * corner (what we assume) which is different than the
			 * 
			 * original NCEP algorithms which used the NE corner as
			 * 
			 * the origin in the southern hemisphere (left-hand vs.
			 * 
			 * right-hand coordinate?)
			 * 
			 */

			I = HEMI * I;

			J = HEMI * J;

		} else {

			System.out.println("ERROR: Do not know map projection " + MAP_PROJ);

		}

		double[] LOC = new double[2];

		LOC[0] = I; // X

		LOC[1] = J; // Y

		return LOC;

	}
}
