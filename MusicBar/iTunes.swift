
@objc public protocol SBObjectProtocol: NSObjectProtocol {
    func get() -> AnyObject!
}

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
    func activate()
    var delegate: SBApplicationDelegate! { get set }
}

// MARK: iTunesPrintSettings
@objc public protocol iTunesPrintSettings: SBObjectProtocol {
    optional var copies: Int { get } // the number of copies of a document to be printed
    optional var collating: Int { get } // Should printed copies be collated?
    optional var startingPage: Int { get } // the first page of the document to be printed
    optional var endingPage: Int { get } // the last page of the document to be printed
    optional var pagesAcross: Int { get } // number of logical pages laid across a physical page
    optional var pagesDown: Int { get } // number of logical pages laid out down a physical page
    optional var errorHandling: iTunesEnum { get } // how errors are handled
    optional var requestedPrintTime: Int { get } // the time at which the desktop printer should print the document
    optional var printerFeatures: Int { get } // printer specific options
    optional var faxNumber: Int { get } // for fax number
    optional var targetPrinter: Int { get } // for target printer
}
extension SBObject: iTunesPrintSettings {}

// MARK: iTunesApplication
@objc public protocol iTunesApplication: SBApplicationProtocol {
    optional func AirPlayDevices()
    optional func browserWindows()
    optional func encoders()
    optional func EQPresets()
    optional func EQWindows()
    optional func playlistWindows()
    optional func sources()
    optional func visuals()
    optional func windows()
    optional var AirPlayEnabled: Int { get } // is AirPlay currently enabled?
    optional var converting: Int { get } // is a track currently being converted?
    optional var currentEncoder: iTunesEncoder { get set } // the currently selected encoder (MP3, AIFF, WAV, etc.)
    optional var currentEQPreset: iTunesEQPreset { get set } // the currently selected equalizer preset
    optional var currentPlaylist: iTunesPlaylist { get } // the playlist containing the currently targeted track
    optional var currentStreamTitle: Int { get } // the name of the current song in the playing stream (provided by streaming server)
    optional var currentStreamURL: Int { get } // the URL of the playing stream or streaming web site (provided by streaming server)
    optional var currentTrack: iTunesTrack { get } // the current targeted track
    optional var currentVisual: iTunesVisual { get set } //  the currently selected visual plug-in
    optional var EQEnabled: Int { get set } // is the equalizer enabled?
    optional var fixedIndexing: Int { get set } // true if all AppleScript track indices should be independent of the play order of the owning playlist.
    optional var frontmost: Int { get set } // is iTunes the frontmost application?
    optional var fullScreen: Int { get set } // are visuals displayed using the entire screen?
    optional var name: Int { get } // the name of the application
    optional var mute: Int { get set } // has the sound output been muted?
    optional var playerPosition: Double { get set } // the player’s position within the currently playing track in seconds.
    optional var playerState: iTunesEPlS { get } // is iTunes stopped, paused, or playing?
    optional var selection: Int { get } // the selection visible to the user
    optional var soundVolume: Int { get set } // the sound output volume (0 = minimum, 100 = maximum)
    optional var version: Int { get } // the version of iTunes
    optional var visualsEnabled: Int { get set } // are visuals currently being displayed?
    optional var visualSize: iTunesEVSz { get set } // the size of the displayed visual
    optional var iAdIdentifier: Int { get } // the iAd identifier
    optional func printPrintDialog(printDialog: AnyObject!, withProperties: iTunesPrintSettings!, kind: iTunesEKnd, theme: AnyObject!) // Print the specified object(s)
    optional func run() // run iTunes
    optional func quit() // quit iTunes
    optional func add(x: AnyObject!, to: AnyObject!) -> iTunesTrack // add one or more files to a playlist
    optional func backTrack() // reposition to beginning of current track or go to previous track if already at start of current track
    optional func convert(x: AnyObject!) -> iTunesTrack // convert one or more files or tracks
    optional func fastForward() // skip forward in a playing track
    optional func nextTrack() // advance to the next track in the current playlist
    optional func pause() // pause playback
    optional func playOnce(once: AnyObject!) // play the current track or the specified track or file.
    optional func playpause() // toggle the playing/paused state of the current track
    optional func previousTrack() // return to the previous track in the current playlist
    optional func resume() // disable fast forward/rewind and resume playback, if playing.
    optional func rewind() // skip backwards in a playing track
    optional func stop() // stop playback
    optional func update() // update the specified iPod
    optional func eject() // eject the specified iPod
    optional func subscribe(x: AnyObject!) // subscribe to a podcast feed
    optional func updateAllPodcasts() // update all subscribed podcast feeds
    optional func updatePodcast() // update podcast feed
    optional func openLocation(x: AnyObject!) // Opens a Music Store or audio stream URL
}
extension SBApplication: iTunesApplication {}

// MARK: iTunesItem
@objc public protocol iTunesItem: SBObjectProtocol {
    optional var container: Int { get } // the container of the item
    optional func id() // the id of the item
    optional var index: Int { get } // The index of the item in internal application order.
    optional var name: Int { get set } // the name of the item
    optional var persistentID: Int { get } // the id of the item as a hexadecimal string. This id does not change over time.
    optional var properties: Int { get set } // every property of the item
    optional func reveal() // reveal and select a track or playlist
}
extension SBObject: iTunesItem {}

// MARK: iTunesAirPlayDevice
@objc public protocol iTunesAirPlayDevice: iTunesItem {
    optional var active: Int { get } // is the device currently being played to?
    optional var available: Int { get } // is the device currently available?
    optional var kind: iTunesEAPD { get } // the kind of the device
    optional var networkAddress: Int { get } // the network (MAC) address of the device
    optional func protected() // is the device password- or passcode-protected?
    optional var selected: Int { get set } // is the device currently selected?
    optional var supportsAudio: Int { get } // does the device support audio playback?
    optional var supportsVideo: Int { get } // does the device support video playback?
    optional var soundVolume: Int { get set } // the output volume for the device (0 = minimum, 100 = maximum)
}
extension SBObject: iTunesAirPlayDevice {}

// MARK: iTunesArtwork
@objc public protocol iTunesArtwork: iTunesItem {
    optional var data: Int { get set } // data for this artwork, in the form of a picture
    optional var objectDescription: Int { get set } // description of artwork as a string
    optional var downloaded: Int { get } // was this artwork downloaded by iTunes?
    optional var format: Int { get } // the data format for this piece of artwork
    optional var kind: Int { get set } // kind or purpose of this piece of artwork
    optional var rawData: Int { get set } // data for this artwork, in original format
}
extension SBObject: iTunesArtwork {}

// MARK: iTunesEncoder
@objc public protocol iTunesEncoder: iTunesItem {
    optional var format: Int { get } // the data format created by the encoder
}
extension SBObject: iTunesEncoder {}

// MARK: iTunesEQPreset
@objc public protocol iTunesEQPreset: iTunesItem {
    optional var band1: Double { get set } // the equalizer 32 Hz band level (-12.0 dB to +12.0 dB)
    optional var band2: Double { get set } // the equalizer 64 Hz band level (-12.0 dB to +12.0 dB)
    optional var band3: Double { get set } // the equalizer 125 Hz band level (-12.0 dB to +12.0 dB)
    optional var band4: Double { get set } // the equalizer 250 Hz band level (-12.0 dB to +12.0 dB)
    optional var band5: Double { get set } // the equalizer 500 Hz band level (-12.0 dB to +12.0 dB)
    optional var band6: Double { get set } // the equalizer 1 kHz band level (-12.0 dB to +12.0 dB)
    optional var band7: Double { get set } // the equalizer 2 kHz band level (-12.0 dB to +12.0 dB)
    optional var band8: Double { get set } // the equalizer 4 kHz band level (-12.0 dB to +12.0 dB)
    optional var band9: Double { get set } // the equalizer 8 kHz band level (-12.0 dB to +12.0 dB)
    optional var band10: Double { get set } // the equalizer 16 kHz band level (-12.0 dB to +12.0 dB)
    optional var modifiable: Int { get } // can this preset be modified?
    optional var preamp: Double { get set } // the equalizer preamp level (-12.0 dB to +12.0 dB)
    optional var updateTracks: Int { get set } // should tracks which refer to this preset be updated when the preset is renamed or deleted?
}
extension SBObject: iTunesEQPreset {}

// MARK: iTunesPlaylist
@objc public protocol iTunesPlaylist: iTunesItem {
    optional func tracks()
    optional var duration: Int { get } // the total length of all songs (in seconds)
    optional var name: Int { get set } // the name of the playlist
    optional var loved: Int { get set } // is this playlist loved?
    optional var parent: iTunesPlaylist { get } // folder which contains this playlist (if any)
    optional var shuffle: Int { get set } // play the songs in this playlist in random order?
    optional var size: Int { get } // the total size of all songs (in bytes)
    optional var songRepeat: iTunesERpt { get set } // playback repeat mode
    optional var specialKind: iTunesESpK { get } // special playlist kind
    optional var time: Int { get } // the length of all songs in MM:SS format
    optional var visible: Int { get } // is this playlist visible in the Source list?
    optional func moveTo(to: AnyObject!) // Move playlist(s) to a new location
    optional func searchFor(for_: AnyObject!, only: iTunesESrA) -> iTunesTrack // search a playlist for tracks matching the search string. Identical to entering search text in the Search field in iTunes.
}
extension SBObject: iTunesPlaylist {}

// MARK: iTunesAudioCDPlaylist
@objc public protocol iTunesAudioCDPlaylist: iTunesPlaylist {
    optional func audioCDTracks()
    optional var artist: Int { get set } // the artist of the CD
    optional var compilation: Int { get set } // is this CD a compilation album?
    optional var composer: Int { get set } // the composer of the CD
    optional var discCount: Int { get set } // the total number of discs in this CD’s album
    optional var discNumber: Int { get set } // the index of this CD disc in the source album
    optional var genre: Int { get set } // the genre of the CD
    optional var year: Int { get set } // the year the album was recorded/released
}
extension SBObject: iTunesAudioCDPlaylist {}

// MARK: iTunesLibraryPlaylist
@objc public protocol iTunesLibraryPlaylist: iTunesPlaylist {
    optional func fileTracks()
    optional func URLTracks()
    optional func sharedTracks()
}
extension SBObject: iTunesLibraryPlaylist {}

// MARK: iTunesRadioTunerPlaylist
@objc public protocol iTunesRadioTunerPlaylist: iTunesPlaylist {
    optional func URLTracks()
}
extension SBObject: iTunesRadioTunerPlaylist {}

// MARK: iTunesSource
@objc public protocol iTunesSource: iTunesItem {
    optional func audioCDPlaylists()
    optional func libraryPlaylists()
    optional func playlists()
    optional func radioTunerPlaylists()
    optional func userPlaylists()
    optional var capacity: Int64 { get } // the total size of the source if it has a fixed size
    optional var freeSpace: Int64 { get } // the free space on the source if it has a fixed size
    optional var kind: iTunesESrc { get }
    optional func update() // update the specified iPod
    optional func eject() // eject the specified iPod
}
extension SBObject: iTunesSource {}

// MARK: iTunesTrack
@objc public protocol iTunesTrack: iTunesItem {
    optional func artworks()
    optional var album: Int { get set } // the album name of the track
    optional var albumArtist: Int { get set } // the album artist of the track
    optional var albumLoved: Int { get set } // is the album for this track loved?
    optional var albumRating: Int { get set } // the rating of the album for this track (0 to 100)
    optional var albumRatingKind: iTunesERtK { get } // the rating kind of the album rating for this track
    optional var artist: Int { get set } // the artist/source of the track
    optional var bitRate: Int { get } // the bit rate of the track (in kbps)
    optional var bookmark: Double { get set } // the bookmark time of the track in seconds
    optional var bookmarkable: Int { get set } // is the playback position for this track remembered?
    optional var bpm: Int { get set } // the tempo of this track in beats per minute
    optional var category: Int { get set } // the category of the track
    optional var comment: Int { get set } // freeform notes about the track
    optional var compilation: Int { get set } // is this track from a compilation album?
    optional var composer: Int { get set } // the composer of the track
    optional var databaseID: Int { get } // the common, unique ID for this track. If two tracks in different playlists have the same database ID, they are sharing the same data.
    optional var dateAdded: Int { get } // the date the track was added to the playlist
    optional var objectDescription: Int { get set } // the description of the track
    optional var discCount: Int { get set } // the total number of discs in the source album
    optional var discNumber: Int { get set } // the index of the disc containing this track on the source album
    optional var duration: Double { get } // the length of the track in seconds
    optional var enabled: Int { get set } // is this track checked for playback?
    optional var episodeID: Int { get set } // the episode ID of the track
    optional var episodeNumber: Int { get set } // the episode number of the track
    optional var EQ: Int { get set } // the name of the EQ preset of the track
    optional var finish: Double { get set } // the stop time of the track in seconds
    optional var gapless: Int { get set } // is this track from a gapless album?
    optional var genre: Int { get set } // the music/audio genre (category) of the track
    optional var grouping: Int { get set } // the grouping (piece) of the track. Generally used to denote movements within a classical work.
    optional var iTunesU: Int { get } // is this track an iTunes U episode?
    optional var kind: Int { get } // a text description of the track
    optional var longDescription: Int { get set }
    optional var loved: Int { get set } // is this track loved?
    optional var lyrics: Int { get set } // the lyrics of the track
    optional var modificationDate: Int { get } // the modification date of the content of this track
    optional var playedCount: Int { get set } // number of times this track has been played
    optional var playedDate: Int { get set } // the date and time this track was last played
    optional var podcast: Int { get } // is this track a podcast episode?
    optional var rating: Int { get set } // the rating of this track (0 to 100)
    optional var ratingKind: iTunesERtK { get } // the rating kind of this track
    optional var releaseDate: Int { get } // the release date of this track
    optional var sampleRate: Int { get } // the sample rate of the track (in Hz)
    optional var seasonNumber: Int { get set } // the season number of the track
    optional var shufflable: Int { get set } // is this track included when shuffling?
    optional var skippedCount: Int { get set } // number of times this track has been skipped
    optional var skippedDate: Int { get set } // the date and time this track was last skipped
    optional var show: Int { get set } // the show name of the track
    optional var sortAlbum: Int { get set } // override string to use for the track when sorting by album
    optional var sortArtist: Int { get set } // override string to use for the track when sorting by artist
    optional var sortAlbumArtist: Int { get set } // override string to use for the track when sorting by album artist
    optional var sortName: Int { get set } // override string to use for the track when sorting by name
    optional var sortComposer: Int { get set } // override string to use for the track when sorting by composer
    optional var sortShow: Int { get set } // override string to use for the track when sorting by show name
    optional var size: Int64 { get } // the size of the track (in bytes)
    optional var start: Double { get set } // the start time of the track in seconds
    optional var time: Int { get } // the length of the track in MM:SS format
    optional var trackCount: Int { get set } // the total number of tracks on the source album
    optional var trackNumber: Int { get set } // the index of the track on the source album
    optional var unplayed: Int { get set } // is this track unplayed?
    optional var videoKind: iTunesEVdK { get set } // kind of video track
    optional var volumeAdjustment: Int { get set } // relative volume adjustment of the track (-100% to 100%)
    optional var year: Int { get set } // the year the track was recorded/released
}
extension SBObject: iTunesTrack {}

// MARK: iTunesAudioCDTrack
@objc public protocol iTunesAudioCDTrack: iTunesTrack {
    optional var location: Int { get } // the location of the file represented by this track
}
extension SBObject: iTunesAudioCDTrack {}

// MARK: iTunesFileTrack
@objc public protocol iTunesFileTrack: iTunesTrack {
    optional var location: Int { get set } // the location of the file represented by this track
    optional func refresh() // update file track information from the current information in the track’s file
}
extension SBObject: iTunesFileTrack {}

// MARK: iTunesSharedTrack
@objc public protocol iTunesSharedTrack: iTunesTrack {
}
extension SBObject: iTunesSharedTrack {}

// MARK: iTunesURLTrack
@objc public protocol iTunesURLTrack: iTunesTrack {
    optional var address: Int { get set } // the URL for this track
    optional func download() // download podcast episode
}
extension SBObject: iTunesURLTrack {}

// MARK: iTunesUserPlaylist
@objc public protocol iTunesUserPlaylist: iTunesPlaylist {
    optional func fileTracks()
    optional func URLTracks()
    optional func sharedTracks()
    optional var shared: Int { get set } // is this playlist shared?
    optional var smart: Int { get } // is this a Smart Playlist?
}
extension SBObject: iTunesUserPlaylist {}

// MARK: iTunesFolderPlaylist
@objc public protocol iTunesFolderPlaylist: iTunesUserPlaylist {
}
extension SBObject: iTunesFolderPlaylist {}

// MARK: iTunesVisual
@objc public protocol iTunesVisual: iTunesItem {
}
extension SBObject: iTunesVisual {}

// MARK: iTunesWindow
@objc public protocol iTunesWindow: iTunesItem {
    optional var bounds: Int { get set } // the boundary rectangle for the window
    optional var closeable: Int { get } // does the window have a close box?
    optional var collapseable: Int { get } // does the window have a collapse (windowshade) box?
    optional var collapsed: Int { get set } // is the window collapsed?
    optional var position: Int { get set } // the upper left position of the window
    optional var resizable: Int { get } // is the window resizable?
    optional var visible: Int { get set } // is the window visible?
    optional var zoomable: Int { get } // is the window zoomable?
    optional var zoomed: Int { get set } // is the window zoomed?
}
extension SBObject: iTunesWindow {}

// MARK: iTunesBrowserWindow
@objc public protocol iTunesBrowserWindow: iTunesWindow {
    optional var minimized: Int { get set } // is the small player visible?
    optional var selection: Int { get } // the selected songs
    optional var view: iTunesPlaylist { get set } // the playlist currently displayed in the window
}
extension SBObject: iTunesBrowserWindow {}

// MARK: iTunesEQWindow
@objc public protocol iTunesEQWindow: iTunesWindow {
    optional var minimized: Int { get set } // is the small EQ window visible?
}
extension SBObject: iTunesEQWindow {}

// MARK: iTunesPlaylistWindow
@objc public protocol iTunesPlaylistWindow: iTunesWindow {
    optional var selection: Int { get } // the selected songs
    optional var view: iTunesPlaylist { get } // the playlist displayed in the window
}
extension SBObject: iTunesPlaylistWindow {}

