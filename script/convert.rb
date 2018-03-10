# encoding: utf-8

require 'csv'
require 'pp'
require 'fileutils'


####################
## bulk converter for csv datafile
##

class KittyConverter

###
# 1-99_999/
#   1.csv      ### 1-999.csv
#   2.csv      ##  1_000-1_999.csv
#   3.csv      ##  2_000-2_999.csv
#   ...
#   99.csv     ### 90_000- 99_999.csv
# 100_000-199_999/
#  100.csv
#  101.csv    ### 101_000-101_999.csv
#  102.csv    ### 102_000-102_999.csv
# 200_000_299_999/
# 300_000-399_999/
# 400_000-499_999/
# 500_000-599_999/
# 600_000-699_999/


DIR={
  0 => '1-99_999',
  1 => '100_000-199_999',
  2 => '200_000_299_999',
  3 => '300_000-399_999',
  4 => '400_000-499_999',
  5 => '500_000-599_999',
  6 => '600_000-699_999',
  7 => '700_000-799_999',
  8 => '800_000-899_999',
  9 => '900_000-999_999',
}


def id_to_nos( id )
  dir_no  = id / 100_000     ## e.g. 0-9 ++ 1 => 100_000-199_999 ...
  file_no = id / 1000        ## e.g. 0-999 ++ 1 => 001 ...

  ## puts "id: #{id} => #{dir_no} / #{file_no}"

  [dir_no, file_no]
end



HEADERS = ['id',
           'gen',
           'matron_id',
           'sire_id',
           'birthdate',
           'genes',
           'name']



def initialize
  @last_no   = [-1,-1]
  @last_out  = nil
end



def out_for( id, out_dir: )
  no = id_to_nos( id )
  print no.inspect

  ## check for new section / batch
  ##  if yes, close old file and open new file
  if @last_no[1] != no[1]
     @last_out.close   if @last_out

     root     = "#{out_dir}/#{DIR[no[0]]}"
     num      = '%03d' % no[1]    ## use 000, 001, 002, 099,
                                  ##     100, 101, 102, ... etc.
     filepath = "#{root}/#{num}.csv"
     puts "\n** >#{filepath}<:"

     FileUtils.mkdir_p( root ) unless Dir.exist?( root )

     out = CSV.open( filepath, 'w' )
     out << HEADERS
     @last_out = out
  end

  @last_no = no
  @last_out
end


def convert( path, out_dir: './o' )
  i       = 0
  last_id = 0
  out     = nil

  CSV.foreach( path, headers: true ) do |row|
    if i==0
      pp row
      pp row.headers
    end

    id = row['id'].to_i
    print id
    print "."

    if id < last_id
      puts "!!! kitty id must be greater than last id"
      exit 1
    end

    last_id = id

    rec = []
    rec << row['id']
    rec << row['gen']
    rec << (row['matron_id'] == '0' ? nil : row['matron_id'])
    rec << (row['sire_id'] == '0' ? nil : row['sire_id'])
    rec << row['birth_date']
    rec << fmt_kai(row['genes_kai'])
    rec << nil  ## name

    out = out_for( id, out_dir: out_dir )
    out << rec

    i+=1
    ## break if i>=2002
  end

  print "\n"
  out.close   ## close last out(put) file/stream
end


#########################
### format helpers

def fmt_kai( kai )
  ## format in groups of four (4) separated by space
  ##  e.g.  ccac7787fa7fafaa16467755f9ee444467667366cccceede
  ##     :  ccac 7787 fa7f afaa 1646 7755 f9ee 4444 6766 7366 cccc eede
  kai.reverse.gsub( /(.{4})/, '\1 ').reverse.strip
end

end # class KittyConverter



conv = KittyConverter.new
conv.convert( 'dl/kittydex-20180309.csv', out_dir: '../kitties' )
