<CODEGEN_FILENAME>Services.dbl</CODEGEN_FILENAME>
;;******************************************************************************
;;WARNING: This file was created by CodeGen. Changes will be lost if regenerated
;;******************************************************************************

import System
import System.Reflection

namespace <NAMESPACE>

    ;;; <summary>
    ;;; This class exposes Synergy methods to the client application. Notice that
    ;;; it is a PARTIAL class, so additional code generated methods can be added
    ;;; to the class (for example via the ServicesCRUD template), and other
    ;;; hand-crafted methods could be added in seperate source files.
    ;;; </summary>
    public partial class Services extends MarshalByRefObject
		
        public method Services
		        endparams
	      proc
            ;;Set the DAT: encironment variable so we can find our files
            data dataPath, String, string.Format("{0}\..\..\data",System.IO.Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location))
            data status, i4
            xcall setlog("DAT",dataPath,status)
            
            ;;Ensure that any xfServer connections are locked to this thread.
            try
            begin
                xcall s_server_thread_init
            end
            catch (e, @Exception)
            begin
                nop	
            end
            endtry
            
        endmethod
		
	endclass
	
endnamespace

