
enum iTunesEKnd {
	iTunesEKndTrackListing = 'kTrk' /* a basic listing of tracks within a playlist */,
	iTunesEKndAlbumListing = 'kAlb' /* a listing of a playlist grouped by album */,
	iTunesEKndCdInsert = 'kCDi' /* a printout of the playlist for jewel case inserts */
};
typedef enum iTunesEKnd iTunesEKnd;

enum iTunesEnum {
	iTunesEnumStandard = 'lwst' /* Standard PostScript error handling */,
	iTunesEnumDetailed = 'lwdt' /* print a detailed report of PostScript errors */
};
typedef enum iTunesEnum iTunesEnum;

enum iTunesEPlS {
	iTunesEPlSStopped = 'kPSS',
	iTunesEPlSPlaying = 'kPSP',
	iTunesEPlSPaused = 'kPSp',
	iTunesEPlSFastForwarding = 'kPSF',
	iTunesEPlSRewinding = 'kPSR'
};
typedef enum iTunesEPlS iTunesEPlS;

enum iTunesERpt {
	iTunesERptOff = 'kRpO',
	iTunesERptOne = 'kRp1',
	iTunesERptAll = 'kAll'
};
typedef enum iTunesERpt iTunesERpt;

enum iTunesEVSz {
	iTunesEVSzSmall = 'kVSS',
	iTunesEVSzMedium = 'kVSM',
	iTunesEVSzLarge = 'kVSL'
};
typedef enum iTunesEVSz iTunesEVSz;

enum iTunesESrc {
	iTunesESrcLibrary = 'kLib',
	iTunesESrcIPod = 'kPod',
	iTunesESrcAudioCD = 'kACD',
	iTunesESrcMP3CD = 'kMCD',
	iTunesESrcRadioTuner = 'kTun',
	iTunesESrcSharedLibrary = 'kShd',
	iTunesESrcUnknown = 'kUnk'
};
typedef enum iTunesESrc iTunesESrc;

enum iTunesESrA {
	iTunesESrAAlbums = 'kSrL' /* albums only */,
	iTunesESrAAll = 'kAll' /* all text fields */,
	iTunesESrAArtists = 'kSrR' /* artists only */,
	iTunesESrAComposers = 'kSrC' /* composers only */,
	iTunesESrADisplayed = 'kSrV' /* visible text fields */,
	iTunesESrASongs = 'kSrS' /* song names only */
};
typedef enum iTunesESrA iTunesESrA;

enum iTunesESpK {
	iTunesESpKNone = 'kNon',
	iTunesESpKBooks = 'kSpA',
	iTunesESpKFolder = 'kSpF',
	iTunesESpKGenius = 'kSpG',
	iTunesESpKITunesU = 'kSpU',
	iTunesESpKLibrary = 'kSpL',
	iTunesESpKMovies = 'kSpI',
	iTunesESpKMusic = 'kSpZ',
	iTunesESpKPodcasts = 'kSpP',
	iTunesESpKPurchasedMusic = 'kSpM',
	iTunesESpKTVShows = 'kSpT'
};
typedef enum iTunesESpK iTunesESpK;

enum iTunesEVdK {
	iTunesEVdKNone = 'kNon' /* not a video or unknown video kind */,
	iTunesEVdKHomeVideo = 'kVdH' /* home video track */,
	iTunesEVdKMovie = 'kVdM' /* movie track */,
	iTunesEVdKMusicVideo = 'kVdV' /* music video track */,
	iTunesEVdKTVShow = 'kVdT' /* TV show track */
};
typedef enum iTunesEVdK iTunesEVdK;

enum iTunesERtK {
	iTunesERtKUser = 'kRtU' /* user-specified rating */,
	iTunesERtKComputed = 'kRtC' /* iTunes-computed rating */
};
typedef enum iTunesERtK iTunesERtK;

enum iTunesEAPD {
	iTunesEAPDComputer = 'kAPC',
	iTunesEAPDAirPortExpress = 'kAPX',
	iTunesEAPDAppleTV = 'kAPT',
	iTunesEAPDAirPlayDevice = 'kAPO',
	iTunesEAPDUnknown = 'kAPU'
};
typedef enum iTunesEAPD iTunesEAPD;
