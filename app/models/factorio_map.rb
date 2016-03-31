class FactorioMap < ActiveRecord::Base
  belongs_to :user
  has_many :comments # NHO: recommend adding method: `dependent: :destroy` on this has_many association
  # With this, whenever a map is deleted, all of its associated comments are also deleted. Prevented any "orphaned" records
  has_attached_file :zip
  do_not_validate_attachment_file_type :zip # NHO: probably want to add a validation to ensure the file is a .zip file

  # TODO: Create method to erase file from remote host on destroy

  def extract_preview_img
    # NHO: great job on a solution for a tricky problem!
    # One thing that could be really useful here is some error handling and/or a fail safe if bad upload...

    #strings needed for readability
    attach_name = "preview.png" # the file name in the zip and when on the server
    zip_name = self.zip.instance[:zip_file_name] # full remote path/ name.zip
    img_path = zip_name.chomp(".zip") + "/preview.png" # full path within zip to image
    zip_dir = self.zip.path.chomp(zip_name) # remote path to zip directory
    extract_path = zip_dir + "preview.png" #remote path to extracted image

    #extracts preview.png from uploaded zip file
    Zip.warn_invalid_date = false # TODO: This could probably go somewhere else...
    archive = Zip::File.open(self.zip.path)
    entry = archive.find_entry(img_path) # TODO: Should change to get_entry for added check?
    archive.extract(entry, extract_path)

    #set img_url to newly extracted
    self.generate_img_url
  end

  def generate_img_url
    self.img_url = self.zip.url.split(self.zip_file_name)[0] + "preview.png"
    self.save
  end

end
