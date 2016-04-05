(**************************************************************************)
(*                                                                        *)
(*  Copyright 2012 OCamlPro                                               *)
(*                                                                        *)
(*  All rights reserved.  This file is distributed under the terms of     *)
(*  the GNU Public License version 3.0.                                   *)
(*                                                                        *)
(*  TypeRex is distributed in the hope that it will be useful,            *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU General Public License for more details.                          *)
(*                                                                        *)
(**************************************************************************)

open Printf
open DwarfTypes

let string_of_AT =
  function
    DW_AT_sibling ->"DW_AT_sibling"
  | DW_AT_location ->"DW_AT_location"
  | DW_AT_name ->"DW_AT_name"
  | DW_AT_ordering ->"DW_AT_ordering"
  | DW_AT_byte_size ->"DW_AT_byte_size"
  | DW_AT_bit_offset ->"DW_AT_bit_offset"
  | DW_AT_bit_size ->"DW_AT_bit_size"
  | DW_AT_stmt_list ->"DW_AT_stmt_list"
  | DW_AT_low_pc ->"DW_AT_low_pc"
  | DW_AT_high_pc ->"DW_AT_high_pc"
  | DW_AT_language ->"DW_AT_language"
  | DW_AT_discr ->"DW_AT_discr"
  | DW_AT_discr_value ->"DW_AT_discr_value"
  | DW_AT_visibility ->"DW_AT_visibility"
  | DW_AT_import ->"DW_AT_import"
  | DW_AT_string_length ->"DW_AT_string_length"
  | DW_AT_common_reference ->"DW_AT_common_reference"
  | DW_AT_comp_dir ->"DW_AT_comp_dir"
  | DW_AT_const_value ->"DW_AT_const_value"
  | DW_AT_containing_type ->"DW_AT_containing_type"
  | DW_AT_default_value ->"DW_AT_default_value"
  | DW_AT_inline ->"DW_AT_inline"
  | DW_AT_is_optional ->"DW_AT_is_optional"
  | DW_AT_lower_bound ->"DW_AT_lower_bound"
  | DW_AT_producer ->"DW_AT_producer"
  | DW_AT_prototyped ->"DW_AT_prototyped"
  | DW_AT_return_addr ->"DW_AT_return_addr"
  | DW_AT_start_scope ->"DW_AT_start_scope"
  | DW_AT_bit_stride ->"DW_AT_bit_stride"
  | DW_AT_upper_bound ->"DW_AT_upper_bound"
  | DW_AT_abstract_origin ->"DW_AT_abstract_origin"
  | DW_AT_accessibility ->"DW_AT_accessibility"
  | DW_AT_address_class ->"DW_AT_address_class"
  | DW_AT_artificial ->"DW_AT_artificial"
  | DW_AT_base_types ->"DW_AT_base_types"
  | DW_AT_calling_convention ->"DW_AT_calling_convention"
  | DW_AT_count ->"DW_AT_count"
  | DW_AT_data_member_location ->"DW_AT_data_member_location"
  | DW_AT_decl_column ->"DW_AT_decl_column"
  | DW_AT_decl_file ->"DW_AT_decl_file"
  | DW_AT_decl_line ->"DW_AT_decl_line"
  | DW_AT_declaration ->"DW_AT_declaration"
  | DW_AT_discr_list ->"DW_AT_discr_list"
  | DW_AT_encoding ->"DW_AT_encoding"
  | DW_AT_external ->"DW_AT_external"
  | DW_AT_frame_base ->"DW_AT_frame_base"
  | DW_AT_friend ->"DW_AT_friend"
  | DW_AT_identifier_case ->"DW_AT_identifier_case"
  | DW_AT_macro_info ->"DW_AT_macro_info"
  | DW_AT_namelist_item ->"DW_AT_namelist_item"
  | DW_AT_priority ->"DW_AT_priority"
  | DW_AT_segment ->"DW_AT_segment"
  | DW_AT_specification ->"DW_AT_specification"
  | DW_AT_static_link ->"DW_AT_static_link"
  | DW_AT_type ->"DW_AT_type"
  | DW_AT_use_location ->"DW_AT_use_location"
  | DW_AT_variable_parameter ->"DW_AT_variable_parameter"
  | DW_AT_virtuality ->"DW_AT_virtuality"
  | DW_AT_vtable_elem_location ->"DW_AT_vtable_elem_location"
  | DW_AT_allocated ->"DW_AT_allocated"
  | DW_AT_associated ->"DW_AT_associated"
  | DW_AT_data_location ->"DW_AT_data_location"
  | DW_AT_byte_stride ->"DW_AT_byte_stride"
  | DW_AT_entry_pc ->"DW_AT_entry_pc"
  | DW_AT_use_UTF8 ->"DW_AT_use_UTF8"
  | DW_AT_extension ->"DW_AT_extension"
  | DW_AT_ranges ->"DW_AT_ranges"
  | DW_AT_trampoline ->"DW_AT_trampoline"
  | DW_AT_call_column ->"DW_AT_call_column"
  | DW_AT_call_file ->"DW_AT_call_file"
  | DW_AT_call_line ->"DW_AT_call_line"
  | DW_AT_description ->"DW_AT_description"
  | DW_AT_binary_scale ->"DW_AT_binary_scale"
  | DW_AT_decimal_scale ->"DW_AT_decimal_scale"
  | DW_AT_small ->"DW_AT_small"
  | DW_AT_decimal_sign ->"DW_AT_decimal_sign"
  | DW_AT_digit_count ->"DW_AT_digit_count"
  | DW_AT_picture_string ->"DW_AT_picture_string"
  | DW_AT_mutable ->"DW_AT_mutable"
  | DW_AT_threads_scaled ->"DW_AT_threads_scaled"
  | DW_AT_explicit ->"DW_AT_explicit"
  | DW_AT_object_pointer ->"DW_AT_object_pointer"
  | DW_AT_endianity ->"DW_AT_endianity"
  | DW_AT_elemental ->"DW_AT_elemental"
  | DW_AT_pure ->"DW_AT_pure"
  | DW_AT_recursive ->"DW_AT_recursive"
  | DW_AT_signature -> "DW_AT_signature"
  | DW_AT_main_subprogram -> "DW_AT_main_subprogram"
  | DW_AT_data_bit_offset -> "DW_AT_data_bit_offset"
  | DW_AT_const_expr -> "DW_AT_const_expr"
  | DW_AT_enum_class -> "DW_AT_enum_class"
  | DW_AT_linkage_name -> "DW_AT_linkage_name"
  | DW_AT_user w ->"DW_AT_user"
  | DW_AT_unk w -> Printf.sprintf "unknown DW_AT %Lu" w

let string_of_TAG =
  function
    DW_TAG_array_type ->"DW_TAG_array_type"
  | DW_TAG_class_type ->"DW_TAG_class_type"
  | DW_TAG_entry_point ->"DW_TAG_entry_point"
  | DW_TAG_enumeration_type ->"DW_TAG_enumeration_type"
  | DW_TAG_formal_parameter ->"DW_TAG_formal_parameter"
  | DW_TAG_imported_declaration ->"DW_TAG_imported_declaration"
  | DW_TAG_label ->"DW_TAG_label"
  | DW_TAG_lexical_block ->"DW_TAG_lexical_block"
  | DW_TAG_member ->"DW_TAG_member"
  | DW_TAG_pointer_type ->"DW_TAG_pointer_type"
  | DW_TAG_reference_type ->"DW_TAG_reference_type"
  | DW_TAG_compile_unit ->"DW_TAG_compile_unit"
  | DW_TAG_string_type ->"DW_TAG_string_type"
  | DW_TAG_structure_type ->"DW_TAG_structure_type"
  | DW_TAG_subroutine_type ->"DW_TAG_subroutine_type"
  | DW_TAG_typedef ->"DW_TAG_typedef"
  | DW_TAG_union_type ->"DW_TAG_union_type"
  | DW_TAG_unspecified_parameters ->"DW_TAG_unspecified_parameters"
  | DW_TAG_variant ->"DW_TAG_variant"
  | DW_TAG_common_block ->"DW_TAG_common_block"
  | DW_TAG_common_inclusion ->"DW_TAG_common_inclusion"
  | DW_TAG_inheritance ->"DW_TAG_inheritance"
  | DW_TAG_inlined_subroutine ->"DW_TAG_inlined_subroutine"
  | DW_TAG_module ->"DW_TAG_module"
  | DW_TAG_ptr_to_member_type ->"DW_TAG_ptr_to_member_type"
  | DW_TAG_set_type ->"DW_TAG_set_type"
  | DW_TAG_subrange_type ->"DW_TAG_subrange_type"
  | DW_TAG_with_stmt ->"DW_TAG_with_stmt"
  | DW_TAG_access_declaration ->"DW_TAG_access_declaration"
  | DW_TAG_base_type ->"DW_TAG_base_type"
  | DW_TAG_catch_block ->"DW_TAG_catch_block"
  | DW_TAG_const_type ->"DW_TAG_const_type"
  | DW_TAG_constant ->"DW_TAG_constant"
  | DW_TAG_enumerator ->"DW_TAG_enumerator"
  | DW_TAG_file_type ->"DW_TAG_file_type"
  | DW_TAG_friend ->"DW_TAG_friend"
  | DW_TAG_namelist ->"DW_TAG_namelist"
  | DW_TAG_namelist_item ->"DW_TAG_namelist_item"
  | DW_TAG_packed_type ->"DW_TAG_packed_type"
  | DW_TAG_subprogram ->"DW_TAG_subprogram"
  | DW_TAG_template_type_parameter ->"DW_TAG_template_type_parameter"
  | DW_TAG_template_value_parameter ->"DW_TAG_template_value_parameter"
  | DW_TAG_thrown_type ->"DW_TAG_thrown_type"
  | DW_TAG_try_block ->"DW_TAG_try_block"
  | DW_TAG_variant_part ->"DW_TAG_variant_part"
  | DW_TAG_variable ->"DW_TAG_variable"
  | DW_TAG_volatile_type ->"DW_TAG_volatile_type"
  | DW_TAG_dwarf_procedure ->"DW_TAG_dwarf_procedure"
  | DW_TAG_restrict_type ->"DW_TAG_restrict_type"
  | DW_TAG_interface_type ->"DW_TAG_interface_type"
  | DW_TAG_namespace ->"DW_TAG_namespace"
  | DW_TAG_imported_module ->"DW_TAG_imported_module"
  | DW_TAG_unspecified_type ->"DW_TAG_unspecified_type"
  | DW_TAG_partial_unit ->"DW_TAG_partial_unit"
  | DW_TAG_imported_unit ->"DW_TAG_imported_unit"
  | DW_TAG_condition ->"DW_TAG_condition"
  | DW_TAG_shared_type ->"DW_TAG_shared_type"
  | DW_TAG_user _ -> "DW_TAG_user"

let string_of_abbrev_decl d =
  printf "Number TAG\n";
  printf "%Ld %s\n" d.abbrev_num (string_of_TAG d.abbrev_tag);
  if d.abbrev_has_children then printf "[has children]\n" else printf "[no children]\n";
  let _ = List.map (fun (n,f) -> printf "%s %s\n" (string_of_AT n) (Form.string_of_FORM f)) d.abbrev_attributes in ()

let string_of_abbrev_section tbl =
  Hashtbl.iter (fun k v -> string_of_abbrev_decl v; printf "\n") tbl

let string_of_lineprog_header h =
  printf "  Offset: %22s%x\n" "0x" h.header_offset;
  printf "  Length: %23Lu\n" h.unit_length;
  printf "  DWARF Version: %14d\n" h.version;
  printf "  Prologue length: %13Lu\n" h.header_len;

  printf "  Minimum Instruction Length: %d\n" h.min_inst_len;
  (*printf "max_ops_per_inst : %d\n" h.max_ops_per_inst;*)
  printf "  Initial value of 'is_stmt': %d\n" h.default_is_stmt;

  printf "  Line Base: %19d\n" (DwarfUtils.uint8_to_int8 h.line_base);
  printf "  Line Range: %18d\n" h.line_range;
  printf "  Opcode Base: %17d\n" h.opcode_base;
  print_endline "";

  print_endline " Opcodes:";
  List.iteri (fun i a -> printf "  Opcode %d has %d args\n" (i+1) a) h.standard_opcode_lengths;
  print_endline "";

  if h.include_directories == []
  then print_endline "The Directory Table is empty.\n"
  else begin
      print_endline " The Directory Table:";
      List.iteri (fun i a -> printf "  %d\t%s\n" (i+1) a) h.include_directories;
      print_endline ""
  end;

  if h.file_names == []
  then printf "The File Name Table is empty.\n"
  else begin
      print_endline " The File Name Table:";
      printf "  Entry\tDir\tTime\tSize\tName\n";
      List.iteri (fun i (a,b,c,d) -> printf "  %d\t%d\t%d\t%d\t%s\n" (i+1) b c d a) h.file_names;
      print_endline "";
  end

let string_of_op =
    function
    DW_LNS_copy -> sprintf "DW_LNS_copy \n"
  | DW_LNS_advance_pc (n, adr) -> sprintf "DW_LNS_advance_pc by %d to 0x%x\n" n adr
  | DW_LNS_advance_line (n, l) -> sprintf "DW_LNS_advance_line by %Ld to %d\n" n l
  | DW_LNS_set_file n -> sprintf "DW_LNS_set_file %Lu \n" n
  | DW_LNS_set_column n -> sprintf "DW_LNS_set_column %Lu \n" n
  | DW_LNS_negate_stmt -> sprintf "DW_LNS_negate_stmt \n"
  | DW_LNS_set_basic_block -> sprintf "DW_LNS_set_basic_block \n"
  | DW_LNS_const_add_pc (n, a) -> sprintf "DW_LNS_const_add_pc by %d to 0x%x \n" n a
  | DW_LNS_fixed_advance_pc n -> sprintf "DW_LNS_fixed_advance_pc %Lu \n" n
  | DW_LNS_set_prologue_end -> sprintf "DW_LNS_set_prologue_end \n"
  | DW_LNS_set_epilogue_begin -> sprintf "DW_LNS_set_epilogue_begin \n"
  | DW_LNS_set_isa n -> sprintf "DW_LNS_set_isa %Lu \n" n
  | DW_LNE_end_sequence -> sprintf "DW_LNE_end_sequence \n"
  | DW_LNE_set_address n -> sprintf "DW_LNE_set_address to 0x%Lx \n" n
  | DW_LNE_define_file (s, a, b, c) -> sprintf "DW_LNE_define_file %s %Lu %Lu %Lu \n" s a b c
  | DW_LNE_set_discriminator n -> sprintf "DW_LNE_set_discriminator %Lu \n" n
  | DW_LNE_user n -> sprintf "DW_LNE_user %Lu \n" n
  | DW_LN_spe_op (opc, aa, adr, la, li) -> sprintf "DW_LN_spe_op %d advance address by %d to 0x%x and line by %d to %d\n" opc aa adr la li

let string_of_lineprg l =
    print_endline "Line Number Statements:";
    List.iteri (fun i (ofs,op) -> printf "  [0x%08x]  %s" ofs (string_of_op op)) l;
    print_endline "\n"
