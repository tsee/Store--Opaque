#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


MODULE = Store::Opaque		PACKAGE = Store::Opaque		

void
make_opaque_storage(self)
    SV *self
  PREINIT:
    HV* guts;
  CODE:
    guts = newHV();
    xs_object_magic_attach_struct(aTHX_ SvRV(self), guts);

SV*
_get(self, key)
    SV* self
    SV* key
  PREINIT:
    HV* guts;
    HE* entry;
  INIT:
    guts = (HV*)xs_object_magic_get_struct_rv(aTHX_ self);
  CODE:
    entry = hv_fetch_ent(guts, key, 0, 0);
    if (entry != NULL)
      RETVAL = newSVsv( HeVAL(entry) );
    else
      RETVAL = &PL_sv_undef;
  OUTPUT: RETVAL

void
_set(self, key, value)
    SV* self
    SV* key
    SV* value
  PREINIT:
    HV* guts;
  INIT:
    guts = (HV*)xs_object_magic_get_struct_rv(aTHX_ self);
  CODE:
    hv_store_ent(guts, key, newSVsv(value), 0);


void
DESTROY(self)
    SV* self
  PREINIT:
    HV* guts;
  CODE:
    guts = (HV*)xs_object_magic_get_struct_rv(aTHX_ self); /* delegate to C api */
    SvREFCNT_dec((SV*)guts);

